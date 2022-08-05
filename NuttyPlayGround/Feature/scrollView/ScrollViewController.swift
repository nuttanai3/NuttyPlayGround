//
//  ScrollViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 30/3/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    var interactor: ScrollBusinessLogic?
    var router: (ScrollRoutingLogic & ScrollDataPassing)?

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
        let request = Scroll.Something.Request()
        interactor?.doSomething(request: request)
    }
}

extension ScrollViewController : ScrollDisplayLogic {
    func displaySomethingOnSuccess(viewModel: Scroll.Something.ViewModel) {
        
    }

    func displayErrorMessage(errorMessage: String) {
        
    }
}

// MARK: Setup & Configuration
extension ScrollViewController {
    private func configure() {
        ScrollConfiguration.shared.configure(self)
    }
}
