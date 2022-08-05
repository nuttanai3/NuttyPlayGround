//
//  SocketMobileRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 29/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SocketMobileRouter: NSObject, SocketMobileRoutingLogic, SocketMobileDataPassing {
    weak var viewController: SocketMobileViewController?
    var dataStore: SocketMobileDataStore?
}
