//
//  NFTDeviceCell.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit

class NFTDeviceCell: UITableViewCell {
    
    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var tokenID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    
}
