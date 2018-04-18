//
//  DetailViewController.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 19/04/2018.
//  Copyright © 2018 QamarAbbas. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOtherInfo: UILabel!
    
    var SPVideoObject: SPVideo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func loadData() {
        
        self.lblTitle.text = SPVideoObject?.title
        self.lblDescription.text = SPVideoObject?.overview
        self.lblOtherInfo.text = SPVideoObject?.original_title
        
    }
    
    @IBAction func playVideoAction(_ sender: Any) {
        let alert = UIAlertController.init(title: "Error!", message: "No video available for the selected type", preferredStyle: .alert)
        
        let okBtn = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
}
