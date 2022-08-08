//
//  TaskTestRouter.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 8/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TaskTestRouter: NSObject, TaskTestRoutingLogic, TaskTestDataPassing {
    weak var viewController: TaskTestViewController?
    var dataStore: TaskTestDataStore?
}
