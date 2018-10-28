//
//  NFTDevicesList.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit
import UIEmptyState

class NFTDevicesListViewController: UIViewController {
    
    var selectedDevice: NFTDevice?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Set the data source and delegate
        self.emptyStateDataSource = self
        self.emptyStateDelegate = self
        
        // Remove seperator lines from empty cells
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        self.reloadEmptyStateForTableView(self.tableView)
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "AddDeviceSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
            
        case "DeviceDetailsSegue":
            let deviceDetailsVC = segue.destination as! DeviceDetailsViewController
            deviceDetailsVC.device = self.selectedDevice
        default:
            return
        }
    }
}

extension NFTDevicesListViewController: UITableViewDelegate, UITableViewDataSource, UIEmptyStateDelegate, UIEmptyStateDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TestDataManager.sharedInstance.devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let device = TestDataManager.sharedInstance.devices[indexPath.row]
        let cell = NFTDeviceCell.instantiateFromNib()!
        
        cell.deviceImage.image = device.image
        cell.deviceName.text = device.name
        cell.tokenID.text = device.nftTokenID
        return cell
    }
    
    var emptyStateTitle: NSAttributedString {
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.00),
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        return NSAttributedString(string: "No added devices yet.", attributes: attrs)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedDevice = TestDataManager.sharedInstance.devices[indexPath.row]
        self.performSegue(withIdentifier: "DeviceDetailsSegue", sender: nil)
    }
    
}
