//
//  CollectionTableViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    // MARK: - Constanst
    let collectionViewCellIdentifier = "ProgramsCollectionViewCell"
    let collectionCellNibName = "ProgramsCollectionViewCell"
    var programs : [Programs]?
    
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()

        prepareView()
    }
    
    func prepareView() {
        collectionView.register(UINib(nibName: collectionCellNibName, bundle: nil), forCellWithReuseIdentifier: collectionViewCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
}
extension CollectionTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as! ProgramsCollectionViewCell
        cell.configure(data: (programs?[indexPath.row])!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width, height: contentView.frame.height)
    }
    
}
