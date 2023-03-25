//
//  Network Manager.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/10/10.
//

import Foundation

struct NetworkManager {
    private let apiKey = "28bd003a-a140-88b6-30aa-34a3d1100757:fx"
    private let baseURL = URL(string: "https://api-free.deepl.com/v2")!
    
    // Supported source languages and their corresponding language codes
    enum Language: String {
        case bulgarian = "BG"
        case czech = "CS"
        case danish = "DA"
        case german = "DE"
        case greek = "EL"
        case english = "EN"
        case spanish = "ES"
        case estonian = "ET"
        case finnish = "FI"
        case french = "FR"
        case hungarian = "HU"
        case indonesian = "ID"
        case italian = "IT"
        case japanese = "JA"
        case korean = "KO"
        case lithuanian = "LT"
        case latvian = "LV"
        case norwegian = "NB"
        case dutch = "NL"
        case polish = "PL"
        case portuguese = "PT"
        case romanian = "RO"
        case russian = "RU"
        case slovak = "SK"
        case slovenian = "SL"
        case swedish = "SV"
        case turkish = "TR"
        case ukrainian = "UK"
        case chinese = "ZH"
    }
    
        func translate(text: String, sourceLanguage: Language, targetLanguage: Language, completionHandler: @escaping (Result<String, Error>) -> Void) {
            guard var components = URLComponents(url: baseURL.appendingPathComponent("/translate"), resolvingAgainstBaseURL: true) else {
                completionHandler(.failure(NetworkError.invalidURL))
                return
            }

            components.queryItems = [
                URLQueryItem(name: "auth_key", value: apiKey),
                URLQueryItem(name: "text", value: text),
                URLQueryItem(name: "source_lang", value: sourceLanguage.rawValue),
                URLQueryItem(name: "target_lang", value: targetLanguage.rawValue)
            ]

            guard let url = components.url else {
                completionHandler(.failure(NetworkError.invalidURL))
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completionHandler(.failure(error))
                    return
                }

                guard let data = data, let response = response as? HTTPURLResponse else {
                    completionHandler(.failure(NetworkError.invalidResponse))
                    return
                }

                guard 200..<300 ~= response.statusCode else {
                    completionHandler(.failure(NetworkError.httpError(statusCode: response.statusCode, data: data)))
                    return
                }

                guard let translationResult = try? JSONDecoder().decode(TranslationResult.self, from: data) else {
                    completionHandler(.failure(NetworkError.decodingError))
                    return
                }

                completionHandler(.success(translationResult.translations[0].text))
            }.resume()
        }

        enum NetworkError: Error {
            case invalidURL
            case invalidResponse
            case httpError(statusCode: Int, data: Data)
            case decodingError
        }

        struct TranslationResult: Decodable {
            let translations: [Translation]

            struct Translation: Decodable {
                let text: String
            }
        }
    }
