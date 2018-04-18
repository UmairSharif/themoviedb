//
//  SPCollectionViewManager.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

protocol SPCollectionViewManagerDelegate: NSObjectProtocol {
    func didSelectRow(at indexPath: IndexPath)
    func sizeForCell(at indexPath: IndexPath) -> CGSize
}

class SPCollectionViewManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    var collectionView: UICollectionView?
    var contents = [Any]()
    var sectionCount = 1
    var delegate: SPCollectionViewManagerDelegate?
    var reload: Void {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    init(colView: UICollectionView, cellIdentifier: [String], data: [Any]) {
        super.init()
        contents = data
        collectionView = colView
        registerCells(cellIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.reload
    }
    func registerCells(_ identifiers: [String]) {
        for id in identifiers {
            let nib = UINib(nibName: id, bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: id)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionCount
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SPCollectionViewCell", for: indexPath) as! SPCollectionViewCell
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let del = delegate {
            del.didSelectRow(at: indexPath)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let del = delegate {
            return del.sizeForCell(at: indexPath)
        }else {
            return CGSize(width: 100, height: 100)
        }
    }
}
