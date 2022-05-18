//
//  HomeViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class DashboardViewController: UIViewController {

    
    // MARK: - Constants
    let homeTableViewCellIdentifier = "HomeTableViewCell"
    let homeTableViewCellNibName = "HomeTableViewCell"

    let collectionTableViewCellIdentifier = "CollectionTableViewCell"
    let collectionTableViewCellNibName = "CollectionTableViewCell"

    let profileTableViewCellIdentifier = "ProfileTableViewCell"
    let profileTableViewCellNibName = "ProfileTableViewCell"

    let viewModel = DashboardViewModel()
   
    // MARK: - Properties
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK: - Public
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        bindViewModel()
        let nfTest = Notification(id: 2, title: "title", subtitle: "Subtitle", body: "Body", identifier: "Basic")
        var dateComponents = DateComponents()
        dateComponents.year = Calendar.current.component(.year, from: Date())
        dateComponents.month = Calendar.current.component(.month, from: Date())
        dateComponents.day = 18
        dateComponents.timeZone = TimeZone(abbreviation: "TRT")
        dateComponents.hour = 19
        dateComponents.minute = 59
        NotificationManager.shared.createNotification(notification: nfTest, dateComponents: dateComponents)
    }
    
    func bindViewModel() {
        viewModel.initiliaze()
        viewModel.delegate = self
        homeTableView.reloadData()
    }
    
    func prepareView() {
        Bundle.main.loadNibNamed("DashboardViewController", owner: self, options: nil)
        homeTableView.register(UINib(nibName: homeTableViewCellNibName, bundle: nil), forCellReuseIdentifier: homeTableViewCellIdentifier)
        homeTableView.register(UINib(nibName: collectionTableViewCellNibName, bundle: nil), forCellReuseIdentifier: collectionTableViewCellIdentifier)
        homeTableView.register(UINib(nibName: profileTableViewCellNibName, bundle: nil), forCellReuseIdentifier: profileTableViewCellIdentifier)
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.backgroundColor = .white
    }

}

//MARK: - TableView Delegate DataSource

extension DashboardViewController:UITableViewDelegate,UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath{
            
        case  [0,0]:
            let cell = tableView.dequeueReusableCell(withIdentifier: profileTableViewCellIdentifier,for: indexPath) as! ProfileTableViewCell
            return cell
            
        case [1,0]:
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionTableViewCellIdentifier, for: indexPath) as! CollectionTableViewCell
            cell.programs = viewModel.programs
            return cell

        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: homeTableViewCellIdentifier, for: indexPath ) as! HomeTableViewCell
            cell.configure(data: viewModel.advices[indexPath.row])
            return cell
        }
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
        if indexPath.section == 0 {
            return 180
        }else if indexPath.section == 1 {
            return 300
        }else {
            return 120
        }
    }
    
}

extension DashboardViewController: DataUpdateDelegate {
    
    func didLoadData() {
        self.homeTableView.reloadData()
    }
}

