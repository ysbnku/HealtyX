//
//  HomeViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: - Constants
    let homeTableViewCellIdentifier = "HomeTableViewCell"
    let homeTableViewCellNibName = "HomeTableViewCell"

    let collectionTableViewCellIdentifier = "CollectionTableViewCell"
    let collectionTableViewCellNibName = "CollectionTableViewCell"

    let profileTableViewCellIdentifier = "ProfileTableViewCell"
    let profileTableViewCellNibName = "ProfileTableViewCell"

    lazy var viewModel:HealtyFoodViewModel = {
        return HealtyFoodViewModel()
    }()
    // MARK: - Properties
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - Public
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        initializeViewModel()
 
    }
    
    func initializeViewModel(){
        viewModel.initFetch()
        viewModel.updateLoadingStatusClosure = { [weak self] () in
            let isLoading = self?.viewModel.isLoading ?? false
            if isLoading {
                print("Güncelliyorum")
                
            }else {
                print("iptal güncelleme")
            }
        }
        print(viewModel.numberOfCells)
        viewModel.reloadTableViewClosure = { [weak self]() in
            DispatchQueue.main.sync {
                self?.homeTableView.reloadData()
            }
        }
        homeTableView.reloadData()

    }
    func initializeView(){
        Bundle.main.loadNibNamed("HomeViewController", owner: self, options: nil)
        homeTableView.register(UINib(nibName: homeTableViewCellNibName, bundle: nil), forCellReuseIdentifier: homeTableViewCellIdentifier)
        homeTableView.register(UINib(nibName: collectionTableViewCellNibName, bundle: nil), forCellReuseIdentifier: collectionTableViewCellIdentifier)
        homeTableView.register(UINib(nibName: profileTableViewCellNibName, bundle: nil), forCellReuseIdentifier: profileTableViewCellIdentifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }

}

//MARK: - TableView Delegate DataSource

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: profileTableViewCellIdentifier,for: indexPath) as! ProfileTableViewCell
            return cell
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionTableViewCellIdentifier, for: indexPath) as! CollectionTableViewCell
            return cell
        }
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: homeTableViewCellIdentifier, for: indexPath ) as! HomeTableViewCell
            cell.healtyFoodCellViewModel = viewModel.cellViewModels[indexPath.row]
            return cell
        }
        return UITableViewCell()
   
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tıktık")
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 1 {
            return 300
        }else {
            return 120
        }
    }
    
}

