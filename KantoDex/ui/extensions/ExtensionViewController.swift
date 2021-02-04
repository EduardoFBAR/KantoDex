//
//  ExtensionViewController.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 2/2/21.
//

import UIKit

extension UIViewController {
    
    var activityIndicatorTag: Int { return 7231 }
    var activityIndicatorBackgroundTag: Int { return 7232 }
    
    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.whiteLarge,
        location: CGPoint? = nil) {
        stopActivityIndicator()
        let loc = location ?? self.view.center
        DispatchQueue.main.async(execute: {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.tag = self.activityIndicatorBackgroundTag
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(blurEffectView)
            self.view.bringSubviewToFront(blurEffectView)
            let activityIndicator = UIActivityIndicatorView(style: style)
            activityIndicator.color = UIColor.red
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
            self.view.bringSubviewToFront(activityIndicator)
        })
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async(execute: {
            if let activityIndicator = self.view.subviews.filter(
                {$0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                    activityIndicator.stopAnimating()
                    activityIndicator.removeFromSuperview()
            }
            if let activityIndicatorBackground = self.view.subviews.filter(
                {$0.tag == self.activityIndicatorBackgroundTag}).first as? UIVisualEffectView {
                    activityIndicatorBackground.removeFromSuperview()
            }
        })
    }
    
    func alert(message: String, title: String = "", alertAction: UIAlertAction) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
