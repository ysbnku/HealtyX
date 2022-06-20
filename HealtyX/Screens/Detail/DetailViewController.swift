//
//  DetailViewController.swift
//  HealtyX
//
//  Created by Yavuz Selim BİTMEZ on 7.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableview: BaseTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Bundle.main.loadNibNamed("DetailViewController", owner: self, options: nil)

        
    }
    
   
    private func prepareView() {
       tableview.bindDelegateAndDataSource(self)
        
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
