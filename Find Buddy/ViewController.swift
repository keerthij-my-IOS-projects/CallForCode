//
//  ViewController.swift
//  Find Buddy
//
//  Created by J, Keerthi on 6/29/19.
//  Copyright © 2019 J, Keerthi. All rights reserved.
//

import UIKit
 import SystemConfiguration.CaptiveNetwork

class ViewController: UIViewController {
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ssid = self.getAllWiFiNameList()
        print("SSID: \(ssid)")
    }
    
    
    
    func getAllWiFiNameList() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
//                    break
                }
            }
        }
        return ssid
    }


}

