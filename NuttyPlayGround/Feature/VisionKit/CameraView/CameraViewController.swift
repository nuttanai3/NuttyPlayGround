//
//  CameraViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 2/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import VisionKit

@available(iOS 16.0, *)
class CameraViewController: UIViewController, ImageAnalysisInteractionDelegate, UIGestureRecognizerDelegate {
    var interactor: CameraBusinessLogic?
    var router: (CameraRoutingLogic & CameraDataPassing)?

    // MARK: @IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Data
    private lazy var interaction: ImageAnalysisInteraction = {
        let interaction = ImageAnalysisInteraction()
        interaction.preferredInteractionTypes = .automatic
        return interaction
    }()

    private let imageAnalyzer = ImageAnalyzer()
    
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
        imageView.addInteraction(interaction)
    }

    private func setupView() {
        // set view something
    }
    
    private func showLiveText() {
        guard let image = imageView.image else { return }
        
        Task {
            let configuration = ImageAnalyzer.Configuration([.text])
            
            do {
                let analysis = try await imageAnalyzer.analyze(image, configuration: configuration)
                
                DispatchQueue.main.async {
                    self.interaction.analysis = nil
                    self.interaction.preferredInteractionTypes = []
                    
                    self.interaction.analysis = analysis
                    self.interaction.preferredInteractionTypes = .automatic
                }
                
            } catch {
                print(error.localizedDescription)
                let alert = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: Do something
    func doSomething() {
        let request = Camera.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func actionAction(_ sender: UIButton) {
        
        print("ImageAnalyzer.isSupported: \(ImageAnalyzer.isSupported)")
        showLiveText()
    }
}

@available(iOS 16.0, *)
extension CameraViewController : CameraDisplayLogic {
    func displaySomethingOnSuccess(viewModel: Camera.Something.ViewModel) {
        
    }

    func displayErrorMessage(errorMessage: String) {
        
    }
}

// MARK: Setup & Configuration
@available(iOS 16.0, *)
extension CameraViewController {
    private func configure() {
        CameraConfiguration.shared.configure(self)
    }
}
