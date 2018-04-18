//
//  SPTableViewCell.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

protocol SPTableViewCellDelegate: NSObjectProtocol {
    func didSelectObject(_ object: SPVideo, atIndexPath: IndexPath)
}

class SPTableViewCell: UITableViewCell, SPCollectionViewManagerDelegate {
    
    weak var delegate : SPTableViewCellDelegate?
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
        //let video = contents[indexPath.row] as? SPVideo
        print("tbl cell delegate \(indexPath.row)")
    }
    
    func didSelectObject(_ object: SPVideo, atIndexPath: IndexPath) {
        self.delegate?.didSelectObject(object, atIndexPath: atIndexPath)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
