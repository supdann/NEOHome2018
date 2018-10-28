//
//  AddDeviceViewController.swift
//  NEOHome
//
//  Created by Daniel Montano on 28.10.18.
//  Copyright © 2018 Daniel Montano. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import SwiftyJSON

class AddDeviceViewController: UIViewController, QRCodeReaderViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    @IBAction func scanAction(_ sender: AnyObject) {
        // Retrieve the QRCode content
        // By using the delegate pattern
        readerVC.delegate = self
        
        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result)
            
            let lightbulb = NFTDevice(name: "My Lightbulb", owner: "Aqewkjdheciu23f2f23f43g34g", nftScriptHash: "wdkfjwefjkhdfjohsdkjhdkghsdfsffs", nftTokenID: "135601431c1d2873a359f0d49129cb28449b11efe999e45680f81ccd567fbcca", image: UIImage(named: "device_lightbulb")!)
            lightbulb.service.append(SmartContractService(smartContractName: "Warranty Smart Contract", hash: "sydfjndsjkfhsdlkjfjdsklfhgvkwjhgwks"))
            lightbulb.service.append(SmartContractService(smartContractName: "Smart Refill Program SC", hash: "lkdsfjldjflsjflwkjfwjfewff"))
            lightbulb.service.append(SmartContractService(smartContractName: "BigData Bridge SC", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
            lightbulb.service.append(SmartContractService(smartContractName: "IFTTT Support", hash: "fdjshfkewhfgwlhgo2wjeg2vwef"))
            
            TestDataManager.sharedInstance.devices.append(lightbulb)
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { _ in
                self.performSegue(withIdentifier: "DeviceAddedSegue", sender: nil)
            })
            
            // If it is a JSON
//            if let json = JSON(result?.value) as? JSON {
//                print(json)
//            }
        }
        
        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true, completion: nil)
    }
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    
    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        print("Switching capturing to: \(newCaptureDevice.device.localizedName)")
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
   
}
