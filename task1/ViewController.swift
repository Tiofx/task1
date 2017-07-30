//
//  ViewController.swift
//  task1
//
//  Created by Андрей on 17/07/2017.
//  Copyright (c) 2017 Tiofx. All rights reserved.
//

import UIKit
import SwiftyJSON

let cellIdentifier = "cell"

class ViewController: UIViewController {

    var models: [ShortBookDescription]!

    var tableDelegates: TableDelegates!

    var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        setUpComponents()
        setUpStyle()
        setUpConstraints()
    }

    private func setUpComponents() {
        models = JSONLoader.getShortBooksDescription()
                .array?
                .map({ $0.toShortBooksDescription() })

        tableDelegates = TableDelegates(models: models)


        tableView = UITableView()
        tableView.delegate = tableDelegates
        tableView.dataSource = tableDelegates
        tableView.register(UICustomCell.self, forCellReuseIdentifier: cellIdentifier)

        self.view!.addSubview(tableView)
    }

    private func setUpStyle() {
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    private func setUpConstraints() {
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(20, 20, 20, 20))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class TableDelegates: NSObject, UITableViewDelegate, UITableViewDataSource {
    var models: [ShortBookDescription]!
    static let rowHeight = 77

    public init(models: [ShortBookDescription]) {
        self.models = models
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(TableDelegates.rowHeight)
    }


    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UICustomCell

        cell.model = models[indexPath.row]

        return cell
    }
}