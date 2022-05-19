//
//  HomeViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class DashboardViewController: UIViewController {

    
    // MARK: - Constants
    let homeTableViewCellIdentifier = "AdvicesTableViewCell"
    let homeTableViewCellNibName = "AdvicesTableViewCell"

    let collectionTableViewCellIdentifier = "CollectionTableViewCell"
    let collectionTableViewCellNibName = "CollectionTableViewCell"

    let profileTableViewCellIdentifier = "AsistanTableViewCell"
    let profileTableViewCellNibName = "AsistanTableViewCell"

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
        switch indexPath.section{
            
        case  0:
            let cell = tableView.dequeueReusableCell(withIdentifier: profileTableViewCellIdentifier,for: indexPath) as! AsistanTableViewCell
            return cell
            
        case 1:
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
        switch section {
        case 0: return 1
        case 1: return 1
        default: return 3
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 180
        case 1: return 300
        default: return 120
        }
    }
}

extension DashboardViewController: DataUpdateDelegate {
    
    func didLoadData() {
        self.homeTableView.reloadData()
    }
}

