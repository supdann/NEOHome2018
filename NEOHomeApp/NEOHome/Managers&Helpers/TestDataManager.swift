//
//  TestDataManager.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import UIKit

class TestDataManager {
    
    static let sharedInstance = TestDataManager()
    
    private init(){generateData()}
    
    var devices = [NFTDevice]()
    
    private func generateData(){
        
        let washing_machine = NFTDevice(name: "My Washing Machine", owner: "Aqewkjdheciu23f2f23f43g34g", nftScriptHash: "wdkfjwefjkhdfjohsdkjhdkghsdfsffs", nftTokenID: "836ce524481a955effb246b8fbfb45206788414a1dfce65c09c270b9fbefb5b0", image: UIImage(named: "device_laundry")!)
        washing_machine.service.append(SmartContractService(smartContractName: "Warranty Smart Contract", hash: "sydfjndsjkfhsdlkjfjdsklfhgvkwjhgwks"))
        washing_machine.service.append(SmartContractService(smartContractName: "Smart Refill Program SC", hash: "lkdsfjldjflsjflwkjfwjfewff"))
        washing_machine.service.append(SmartContractService(smartContractName: "Smart Mantainance Program SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        washing_machine.service.append(SmartContractService(smartContractName: "BigData Bridge SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        
        let tesla = NFTDevice(name: "My Tesla", owner: "Aqewkjdheciu23f2f23f43g34g", nftScriptHash: "wdkfjwefjkhdfjohsdkjhdkghsdfsffs", nftTokenID: "94a2e050e58f83a304d425de7e95b6b952ede3f69afe42a56cd345ba8a4443ab", image: UIImage(named: "device_tesla")!)
        tesla.service.append(SmartContractService(smartContractName: "Warranty Smart Contract", hash: "sydfjndsjkfhsdlkjfjdsklfhgvkwjhgwks"))
        tesla.service.append(SmartContractService(smartContractName: "Vehicle License SC", hash: "sydfjndsjkfhsdlkjfjdsklfhgvkwjhgwks"))
        tesla.service.append(SmartContractService(smartContractName: "German TÜV SC", hash: "lkdsfjldjflsjflwkjfwjfewff"))
        tesla.service.append(SmartContractService(smartContractName: "BigData Bridge SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        tesla.service.append(SmartContractService(smartContractName: "Autonomous Car Sharing SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        tesla.service.append(SmartContractService(smartContractName: "Smart Mantainance Program SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        tesla.service.append(SmartContractService(smartContractName: "Smart Trunk SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        
        let vending_machine = NFTDevice(name: "The vending Machine in my shop",owner: "Aqewkjdheciu23f2f23f43g34g", nftScriptHash: "wdkfjwefjkhdfjohsdkjhdkghsdfsffs", nftTokenID: "70c3c6fc848abd396c6a460b2fd7995a3ec2c69274c1702f7ddd8eede3ead5e1", image: UIImage(named: "device_vending_machine")!)
        
        vending_machine.service.append(SmartContractService(smartContractName: "Warranty Smart Contract", hash: "sydfjndsjkfhsdlkjfjdsklfhgvkwjhgwks"))
        vending_machine.service.append(SmartContractService(smartContractName: "Smart Refill Program SC", hash: "lkdsfjldjflsjflwkjfwjfewff"))
        vending_machine.service.append(SmartContractService(smartContractName: "Smart Mantainance Program SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        vending_machine.service.append(SmartContractService(smartContractName: "BigData Bridge SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        vending_machine.service.append(SmartContractService(smartContractName: "Smart Vending Machine SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
        
    
        devices.append(washing_machine)
        devices.append(tesla)
        devices.append(vending_machine)
    }
}
