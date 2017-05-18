//
//  StoresViewController.swift
//  Demo
//
//  Created by Telolahy on 01/06/16.
//  Copyright © 2016 CreativeGames. All rights reserved.
//

import UIKit


protocol StoresViewControllerDelegate {

    func storesViewController(_ viewController: StoresViewController, didSelectStore:Store)
}



class StoresViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {


    // MARK: - Field

    var delegate: StoresViewControllerDelegate?


    // MARK: - Outlet

    @IBOutlet weak var tableView: UITableView!

    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()

        self.title = "Stores"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return AppConfig.availableStores!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let position = indexPath.item
        let store = AppConfig.availableStores![position]

        let cell = UITableViewCell()
        cell.textLabel!.text = store.name
        return cell
    }


    // MARK:- UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.delegate?.storesViewController(self, didSelectStore: AppConfig.availableStores![indexPath.item])
    }

    
}
