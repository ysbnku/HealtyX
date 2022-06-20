//
//  HomeViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class DashboardViewController: BaseViewController {

    
    // MARK: - Constants
    let dashboardViewController = "DashboardViewController"
    let advicesTableViewCellIdentifierAndNib = "AdvicesTableViewCell"
    let programsViewCellIdentifierAndNib = "CollectionTableViewCell"
    let asistanTableViewCellIdentifierAndNib = "AsistanTableViewCell"

    let viewModel = DashboardViewModel()
   
    // MARK: - Properties
    @IBOutlet weak var homeTableView: BaseTableView!
    
    // MARK: - Public
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        bindViewModel()
        NotificationManager.shared.createNotificationByPrograms(.hard)
    }
    
    func bindViewModel() {
        viewModel.initiliaze()
        viewModel.delegate = self
    }
    
    func prepareView() {
        loadViewControllerWithNibName(dashboardViewController)
        homeTableView.registerCellWithNibAndIdentifier(advicesTableViewCellIdentifierAndNib)
        homeTableView.registerCellWithNibAndIdentifier(programsViewCellIdentifierAndNib)
        homeTableView.registerCellWithNibAndIdentifier(asistanTableViewCellIdentifierAndNib)
        homeTableView.bindDelegateAndDataSource(self)
        homeTableView.backgroundColor = .white
 
        
    }

}

//MARK: - TableView Delegate DataSource

extension DashboardViewController:UITableViewDelegate,UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
            
        case tableViewSections.asistan.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: asistanTableViewCellIdentifierAndNib,
                                                     for: indexPath) as! AsistanTableViewCell
            return cell
            
        case tableViewSections.programs.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: programsViewCellIdentifierAndNib,
                                                     for: indexPath) as! CollectionTableViewCell
            cell.programs = viewModel.programs
            return cell
            
        case tableViewSections.advices.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: advicesTableViewCellIdentifierAndNib,
                                                     for: indexPath ) as! HomeTableViewCell
            cell.configure(data: viewModel.advices[indexPath.row])
            return cell
         
        default : return UITableViewCell()
          
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
            
        case tableViewSections.asistan.rawValue: break
        
        case tableViewSections.programs.rawValue: break
   
        case tableViewSections.advices.rawValue:goto()
            
            
        default : print("[*****Dashboard Default Error]")
          
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case tableViewSections.asistan.rawValue: return 1
        case tableViewSections.programs.rawValue: return 1
        case tableViewSections.advices.rawValue: return 3
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case tableViewSections.asistan.rawValue: return 180
        case tableViewSections.programs.rawValue: return 300
        case tableViewSections.advices.rawValue: return 120
        default: return 0
        }
    }
}

extension DashboardViewController: DataUpdateDelegate {
    func didLoadData() {
        self.homeTableView.reloadData()
    }
    
}

enum tableViewSections: Int {
    case asistan = 0
    case programs
    case advices
}
