//
//  Router.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import Foundation
import UIKit

class Router: NSObject {

    static let sharedInstance: Router = {
        let instance = Router()
        return instance
    }()
    
    fileprivate var rootWindow: UIWindow!

    // MARK: - Storyboard names
    
    static let mainStoryboardName = "Main"
    let mainStoryboard = UIStoryboard(name: mainStoryboardName, bundle: nil)

    // MARK: - ViewController identifiers
    
    static let dexViewControllerIdentifier = "DexViewControllerID"
    static let detailViewControllerIdentifier = "DetailViewControllerID"

    func setWindow(_ window: UIWindow) {
        self.rootWindow = window
    }
    
    func loadHomeScreen() {
        let dexViewController = mainStoryboard.instantiateViewController(withIdentifier: Router.dexViewControllerIdentifier) as! DexViewController
        setViewControllerAsRoot(UINavigationController(rootViewController: (dexViewController)))
    }
    
    func loadDetailScreen(id: String, name: String) -> DetailViewController {
        let detailViewController = mainStoryboard.instantiateViewController(withIdentifier: Router.detailViewControllerIdentifier) as! DetailViewController
        detailViewController.presenter = DetailPresenter.init(repository: DetailRepository(), id: id)
        detailViewController.vcTitle = name
        return detailViewController
    }

}

private extension Router {

    func setViewControllerAsRoot(_ viewController: UIViewController) {
        rootWindow.rootViewController = viewController
        rootWindow.makeKeyAndVisible()
    }
}
