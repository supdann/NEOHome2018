//
//  DeviceDetailsView.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit
import UIEmptyState

class DeviceDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var device: NFTDevice?
    
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceTokenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.deviceImageView.image = device?.image
        self.deviceNameLabel.text = device?.name
        self.deviceTokenLabel.text = device?.nftTokenID
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Set the data source and delegate
        self.emptyStateDataSource = self
        self.emptyStateDelegate = self
        
        // Remove seperator lines from empty cells
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        self.reloadEmptyStateForTableView(self.tableView)
    }
}

extension DeviceDetailsViewController: UITableViewDelegate, UITableViewDataSource, UIEmptyStateDelegate, UIEmptyStateDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.device!.service.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = DeviceServiceCell.instantiateFromNib()!
        
        if let device = self.device {
            
            let service = device.service[indexPath.row]
            
            cell.textLabel?.text = service.smartContractName
            
        }
        
        return cell
    }
    
    var emptyStateTitle: NSAttributedString {
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.00),
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        return NSAttributedString(string: "No added devices yet.", attributes: attrs)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
