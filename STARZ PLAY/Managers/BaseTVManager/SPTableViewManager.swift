//
//  SPTableViewManager.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

protocol SPTableViewManagerDelegate: NSObjectProtocol {
    func didSelectObject(_ object: SPVideo, atIndexPath: IndexPath)
}

class SPTableViewManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    var contents = [Any]()
    var sectionCount = 1
    weak var delegate: SPTableViewManagerDelegate?
    var reload: Void {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    init(tblView: UITableView, cellIdentifier: [String], data: [Any]) {
        super.init()
        contents = data
        tableView = tblView
        registerCells(cellIdentifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        self.reload
    }
    func registerCells(_ identifiers: [String]) {
        for id in identifiers {
            let nib = UINib(nibName: id, bundle: nil)
            tableView?.register(nib, forCellReuseIdentifier: id)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell(style: .default, reuseIdentifier: "")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            //
        }
    }
}
