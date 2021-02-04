//
//  DetailViewController.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController, DetailContractView {
    
    @IBOutlet var imagePokemon: UIImageView!
    @IBOutlet var labelType: UILabel!
    @IBOutlet var labelHeight: UILabel!
    @IBOutlet var labelWeight: UILabel!
    @IBOutlet var labelHabitat: UILabel!
    @IBOutlet var labelHappiness: UILabel!
    @IBOutlet var labelCapureRate: UILabel!
    @IBOutlet var labelLegendary: UILabel!
    @IBOutlet var labelDescription: UILabel!
    
    var presenter: DetailContractPresenter?
    var vcTitle: String?
    var backButtonItem: UIBarButtonItem?
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        presenter?.getPokemonSpecies(detailView: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.backButtonItem = UIBarButtonItem.init(image: UIImage(named: IMAGE_NVC_BACK), style: .done, target: self, action: #selector(closeViewController))
        self.backButtonItem?.tintColor = UIColor.white
        self.navigationItem.setLeftBarButton(backButtonItem!, animated: false)
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.isTranslucent = false
        self.title = vcTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setAttributedString(labelTitle: String, label: UILabel, text: String) {
        let attributedString = NSMutableAttributedString(string: labelTitle, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)])
        attributedString.append(NSMutableAttributedString(string: text))
        label.attributedText = attributedString
    }
    
    @objc private func closeViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rotated() {
        if isLoading {
            showLoading()
        }
    }
    
    // MARK: - DetailView Protocol
    
    func setPokemonData(pokemonData: PokemonDetailModel) {
        if let image = pokemonData.image {
            let imageUrl = URL(string: image)
            imagePokemon.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: IMAGE_PLACEHOLDER_CELL))
        }
        
        if let type = pokemonData.type {
            let labelTitle = DETAIL_TYPE + ": "
            setAttributedString(labelTitle: labelTitle, label: labelType, text: type.capitalized)
        }
        
        if let height = pokemonData.height {
            let labelTitle = DETAIL_HEIGHT + ": "
            setAttributedString(labelTitle: labelTitle, label: labelHeight, text: String(height))
        }
        
        if let weight = pokemonData.weight {
            let labelTitle = DETAIL_WEIGHT + ": "
            setAttributedString(labelTitle: labelTitle, label: labelWeight, text: String(weight))
        }
        
        if let habitat = pokemonData.habitat {
            let labelTitle = DETAIL_HABITAT + ": "
            setAttributedString(labelTitle: labelTitle, label: labelHabitat, text: habitat.capitalized)
        }
        
        if let happiness = pokemonData.happiness {
            let labelTitle = DETAIL_HAPPINESS + ": "
            setAttributedString(labelTitle: labelTitle, label: labelHappiness, text: String(happiness))
        }
        
        if let captureRate = pokemonData.captureRate {
            let labelTitle = DETAIL_CAPTURE_RATE + ": "
            setAttributedString(labelTitle: labelTitle, label: labelCapureRate, text: String(captureRate))
        }
        
        if let legendary = pokemonData.isLegendary {
            let labelTitle = DETAIL_LEGENDARY + ": "
            var stringLegendary = NO
            if legendary {
                stringLegendary = YES
            }
            setAttributedString(labelTitle: labelTitle, label: labelLegendary, text: stringLegendary)
        }
        
        if let description = pokemonData.description {
            let labelTitle = DETAIL_DESCRIPTION + ": "
            let cleanedDescription = description.htmlToString
            setAttributedString(labelTitle: labelTitle, label: labelDescription, text: cleanedDescription)
        }
    }
    
    func showAlert(message: String) {
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.closeViewController()
        })
        self.alert(message: message, alertAction: action)
    }
    
    func showLoading() {
        let height = self.view.frame.size.height - topbarHeight
        let center = CGPoint(x: self.view.frame.size.width / 2.0, y: height / 2.0)
        startActivityIndicator(location: center)
        isLoading = true
    }
    
    func hideLoading() {
        stopActivityIndicator()
        isLoading = false
    }

}
