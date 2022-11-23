//
//  PageListViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import VisionKit

class PageListViewController: UIViewController {
    // MARK: @IBOutlet
    @IBOutlet var pageListTableView: UITableView!
    var pageList = [PageListModel]()
    
    var interactor: PageListBusinessLogic?
    var router: (NSObjectProtocol & PageListRoutingLogic & PageListDataPassing)?
    
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
        self.isModalInPresentation = true
        setPageList()
        doSomething()
    }
    
    // MARK: Do something
    
    func doSomething() {
        
        let request = PageList.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func setPageList() {
        pageList.append(PageListModel(name: "Socket Mobile", pageKey: "SocketMobileViewController", storyKey: "SocketMobileStoryboard"))
        pageList.append(PageListModel(name: "EDC", pageKey: "EDCViewController", storyKey: "EDCStoryboard"))
        pageList.append(PageListModel(name: "Nav", pageKey: "NavigationMainViewController", storyKey: "NavigationStoryboard"))
        pageList.append(PageListModel(name: "ScrollView", pageKey: "ScrollViewController", storyKey: "ScrollViewStoryboard"))
        pageList.append(PageListModel(name: "CameraView", pageKey: "CameraViewController", storyKey: "ImageStoryboard"))
        pageList.append(PageListModel(name: "TaskTest", pageKey: "TaskTestViewController", storyKey: "TaskTestStoryboard"))
    }
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: Setup & Configuration
extension PageListViewController {
    private func setup() {
        
    }
    
    private func configure() {
        PageListConfiguration.shared.configure(self)
    }
}

extension PageListViewController : PageListDisplayLogic {
    func displaySomething(viewModel: PageList.Something.ViewModel) {
        
    }
}

@available(iOS 16.0, *)
extension PageListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PageTableViewCell") as? PageTableViewCell {
            cell.setLabel(pageList: pageList[indexPath.row])
            cell.layer.cornerRadius = 20
            cell.layer.borderWidth = 1
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentPage(page: pageList[indexPath.row])
//        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!) //openSetting
        
    }
    
    func presentPage(page: PageListModel){
        if let story = UIStoryboard(name: page.storyKey, bundle: nil) as? UIStoryboard{
            switch page.pageKey {
            case "SocketMobileViewController":
                if let vc = story.instantiateViewController(identifier: page.pageKey) as? SocketMobileViewController{
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true, completion: nil)
                }
            case "EDCViewController":
                if let vc = story.instantiateViewController(identifier: page.pageKey) as? EDCViewController{
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true, completion: nil)
                }
            case "NavigationMainViewController":
                if let vc = story.instantiateViewController(identifier: page.pageKey) as? NavigationMainViewController{
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true, completion: nil)
                }
            case "ScrollViewController":
                if let vc = story.instantiateViewController(identifier: page.pageKey) as? ScrollViewController{
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true, completion: nil)
                }
            case "CameraViewController":
                if let vc = story.instantiateViewController(identifier: page.pageKey) as? CameraViewController{
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true, completion: nil)
                }
            case "TaskTestViewController":
                if let vc = story.instantiateViewController(identifier: page.pageKey) as? TaskTestViewController{
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    present(vc, animated: true, completion: nil)
                }
            default:
                break
            }
        }
    }
}
