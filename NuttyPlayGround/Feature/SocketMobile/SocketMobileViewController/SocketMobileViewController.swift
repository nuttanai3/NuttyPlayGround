//
//  SocketMobileViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 29/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SocketMobileViewController: UIViewController {
    // MARK: @IBOutlet
    
    var interactor: SocketMobileBusinessLogic?
    var router: (NSObjectProtocol & SocketMobileRoutingLogic & SocketMobileDataPassing)?
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
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
        doSomething()
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = SocketMobile.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: Setup & Configuration
extension SocketMobileViewController {
    private func setup() {
        
    }
    
    private func configure() {
        SocketMobileConfiguration.shared.configure(self)
    }
}

extension SocketMobileViewController : SocketMobileDisplayLogic {
    func displaySomething(viewModel: SocketMobile.Something.ViewModel) {
        
    }
}
