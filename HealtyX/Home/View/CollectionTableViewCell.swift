//
//  CollectionTableViewCell.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    // MARK: - Constanst
    let collectionViewCellIdentifier = "HomeCollectionViewCell"
    let collectionCellNibName = "HomeCollectionViewCell"
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: collectionCellNibName, bundle: nil), forCellWithReuseIdentifier: collectionViewCellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CollectionTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    
}
