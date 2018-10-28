//
//  DeviceAddedViewController.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit

class DeviceAddedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in
            self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!, animated: true)
        })
    }
}
