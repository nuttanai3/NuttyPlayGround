//
//  CameraRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 2/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@available(iOS 16.0, *)
class CameraRouter: NSObject, CameraRoutingLogic, CameraDataPassing {
    weak var viewController: CameraViewController?
    var dataStore: CameraDataStore?
}
