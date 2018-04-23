//
//  SPVideoCVManager.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

class SPVideoCVManager: SPCollectionViewManager {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SPCollectionViewCell", for: indexPath) as? SPCollectionViewCell
        let video = contents[indexPath.row] as? SPVideo
        
        var url = URL.init(string: "")
        if let imageUrl = video?.poster_path {
            url = URL(string: kImageBaseUrl+(imageUrl))
        }
        cell?.imgPoster.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder-img"), options: .refreshCached, completed: { (image, error, cacheType, url) in
            if (image) != nil {
                cell?.imgPoster.image = image
            }
        })
        
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = contents[indexPath.row] as? SPVideo
        self.delegate?.didSelectObject(video!, atIndexPath: indexPath)
    }
    
}
