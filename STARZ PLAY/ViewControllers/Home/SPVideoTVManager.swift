//
//  SPVideoTVManager.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

class SPVideoTVManager: SPTableViewManager {
    
    var collectionManager: SPVideoCVManager?
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SPTableViewCell") as? SPTableViewCell
//        tableManager = SPVideoCVManager(col) (tblView: tableVIew, cellIdentifier: ["SPTableViewCell"], data: [SPSearchVideo]())
        if let video = contents[indexPath.row] as? SPSearchVideo {
            cell?.videos = video.videos
            cell?.lblTitle.text = video.title
        }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
