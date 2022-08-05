//
//  NavigationMainViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 23/1/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NavigationMainViewController: UIViewController {
    var interactor: NavigationMainBusinessLogic?
    var router: (NavigationMainRoutingLogic & NavigationMainDataPassing)?

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
        let request = NavigationMain.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    @IBAction func cAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func showAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NavigationStoryboard", bundle: nil)
        let pickColorVC = storyboard.instantiateViewController(withIdentifier: "NavigationAViewController") as UIViewController
        let navigationController = UINavigationController(rootViewController: pickColorVC)
        present(navigationController, animated: true, completion: nil)
    }
}

extension NavigationMainViewController : NavigationMainDisplayLogic {
    func displaySomethingOnSuccess(viewModel: NavigationMain.Something.ViewModel) {
        
    }

    func displayErrorMessage(errorMessage: String) {
        
    }
}

// MARK: Setup & Configuration
extension NavigationMainViewController {
    private func configure() {
        NavigationMainConfiguration.shared.configure(self)
    }
}
