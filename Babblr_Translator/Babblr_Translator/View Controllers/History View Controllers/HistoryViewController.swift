//
//  HistoryViewController.swift
//  Babblr_Translator
//
//  Created by Andy Pang on 2022/11/11.
//

import UIKit

class HistoryViewController : UIViewController {
    
    var historyTableView = UITableView()
    var historyList : [String] = []
    
    let reuseIdentifer = "historyCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utilities.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = Utilities.backgroundColor
        navigationController!.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Utilities.primaryColor!]
        navigationItem.title = "History"
        
        historyTableView = {
            let tableView = UITableView()
            tableView.backgroundColor = Utilities.secondaryColor
            tableView.layer.cornerRadius = 15
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorColor = Utilities.primaryColor
            tableView.showsVerticalScrollIndicator = false
            tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: self.reuseIdentifer)
            return tableView
        }()
        
        Utilities.addViews([historyTableView], view)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            historyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

extension HistoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HistoryViewController : UITableViewDelegate {
    
}
