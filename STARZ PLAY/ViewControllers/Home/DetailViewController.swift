//
//  DetailViewController.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 19/04/2018.
//  Copyright © 2018 QamarAbbas. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

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
        playVideoFromURL(urlString: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
    }
    
    func playVideoFromURL( urlString: String ) {
        if let url:URL = URL.init(string: urlString) {
            let player = AVPlayer(url: url)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            playerViewController.entersFullScreenWhenPlaybackBegins = true
            playerViewController.showsPlaybackControls = true

            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
}
