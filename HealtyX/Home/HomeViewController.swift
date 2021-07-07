//
//  HomeViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: - Constants
    let homeTableViewCellIdentifier = "homeTableViewCellIdentifier"
    let homeTableViewCellNibName = "HomeTableViewCell"

    let collectionTableViewCellIdentifier = "CollectionTableViewCell"
    let collectionTableViewCellNibName = "CollectionTableViewCell"



    // MARK: - Properties
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - Public
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Bundle.main.loadNibNamed("HomeViewController", owner: self, options: nil)
        homeTableView.register(UINib( nibName: homeTableViewCellNibName, bundle: nil), forCellReuseIdentifier: homeTableViewCellIdentifier)
        homeTableView.register(UINib(nibName: collectionTableViewCellNibName, bundle: nil), forCellReuseIdentifier: collectionTableViewCellIdentifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self
 
    }

}

//MARK: - TableView Delegate DataSource

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionTableViewCellIdentifier) as! CollectionTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: homeTableViewCellIdentifier) as! HomeTableViewCell
            return cell
        }
   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        }else {
            return 120
        }
    }
    
}

