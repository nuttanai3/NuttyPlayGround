//
//  NavigationAViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationAViewController: UIViewController {
    var interactor: NavigationABusinessLogic?
    var router: (NavigationARoutingLogic & NavigationADataPassing)?

    // MARK: @IBOutlet

    // MARK: Data
    
    // MARK: View lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        doSomething()
    }

    private func setupView() {
        // set view something
    }
    
    // MARK: Do something
    func doSomething() {
        let request = NavigationA.Something.Request()
        interactor?.doSomething(request: request)
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension NavigationAViewController : NavigationADisplayLogic {
    func displaySomethingOnSuccess(viewModel: NavigationA.Something.ViewModel) {
        
    }

    func displayErrorMessage(errorMessage: String) {
        
    }
}

// MARK: Setup & Configuration
extension NavigationAViewController {
    private func configure() {
        NavigationAConfiguration.shared.configure(self)
    }
}
