//
//  SPTableViewCell.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

class SPTableViewCell: UITableViewCell, SPCollectionViewManagerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    var collectionManager: SPVideoCVManager?
    var videos = [SPVideo](){
        willSet(newValue){
            collectionManager?.contents = newValue
            collectionManager?.reload
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        if collectionManager == nil {
            collectionManager = SPVideoCVManager(colView: collectionView, cellIdentifier: ["SPCollectionViewCell"], data: videos)
            collectionManager?.delegate = self
            
        }
        collectionManager?.reload
        // Initialization code
    }
    func sizeForCell(at indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func didSelectRow(at indexPath: IndexPath) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
