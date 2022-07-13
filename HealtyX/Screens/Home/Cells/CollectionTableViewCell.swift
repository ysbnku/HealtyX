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
    
    private func onSelectedProgram(program: NotificationPrograms, indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! ProgramsCollectionViewCell
        if selectedCell.isSelectedCell {
            selectedCell.isSelectedCell = false
            NotificationManager.shared.createNotificationByPrograms(program)

        }else {
            selectedCell.isSelectedCell = true
            NotificationManager.shared.removeNotifications(identifier: "easy") // Delete control will be dynamic.

        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch NotificationPrograms(rawValue: indexPath.row) {
        case .easy: onSelectedProgram(program: .easy, indexPath: indexPath)
        case .normal: onSelectedProgram(program: .normal, indexPath: indexPath)
        case .hard: onSelectedProgram(program: .hard, indexPath: indexPath)
        case .none: break
        }
    }
    
}

