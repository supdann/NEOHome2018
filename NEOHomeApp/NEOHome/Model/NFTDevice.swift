//
//  NFTDevice.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit

class SmartContractService{
    
    let smartContractName: String
    let smartContractHash: String
    
    init(smartContractName: String, hash: String){
        self.smartContractName = smartContractName
        self.smartContractHash = hash
    }
    
}

class NFTDevice {
    
    let name: String
    let owner: String
    let nftScriptHash: String
    let nftTokenID: String
    var service = [SmartContractService]()
    let image: UIImage
    
    init(name: String, owner: String, nftScriptHash: String, nftTokenID: String, image: UIImage) {
        self.owner = owner
        self.nftScriptHash = nftScriptHash
        self.image = image
        self.name = name
        self.nftTokenID = nftTokenID
    }
    
}
