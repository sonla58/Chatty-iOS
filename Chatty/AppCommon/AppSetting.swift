//
//  AppSetting.swift
//  Chatty
//
//  Created by Anh Son Le on 10/2/18.
//  Copyright © 2018 Anh Son Le. All rights reserved.
//

import Foundation
import GoogleMaps

class AppSetting {
    
    static let shared = AppSetting()
    
    func setUpGoogleMap() {
        GMSServices.provideAPIKey(AppConstant.APIKey.googleMaps.rawValue)
    }
    
}
