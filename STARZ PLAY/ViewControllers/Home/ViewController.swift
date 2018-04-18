//
//  ViewController.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, SPTableViewManagerDelegate {
    var tableManager: SPVideoTVManager?
    @IBOutlet weak var tableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableManager = SPVideoTVManager(tblView: tableVIew, cellIdentifier: ["SPTableViewCell"], data: [SPSearchVideo]())
        tableManager?.delegate = self
        invokeSearchWitHTitle("job")
        invokeSearchWitHTitle("fun")
        invokeSearchWitHTitle("drama")
        // Do any additional setup after loading the view, typically from a nib.
    }
    func invokeSearchWitHTitle(_ title: String) {
        SPAPIManager.shared.getVideoDetail(search: title, success: { (videos) in
            let search = SPSearchVideo(title, videos)
            if var searchArray = self.tableManager?.contents as? [SPSearchVideo] {
                searchArray.append(search)
                self.tableManager?.contents = searchArray
                self.tableManager?.reload
            }
        }) { (errorReason) in
            
        }
    }
    func didSelectRow(at indexPath: IndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

