//
//  DexViewController.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation
import UIKit

class DexViewController: UIViewController, DexContractView {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var viewDexError: UIView!
    
    var presenter: DexContractPresenter?
    var scrollViewHeight: CGFloat?
    var scrollContentSizeHeight: CGFloat?
    var isScrolling = false
    var isLoading = false
    var pokedex: [PokemonBasicModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = DexPresenter.init(repository: DexRepository())
        
        tableView.tableFooterView = UIView()
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        presenter?.getPokedexEntries(dexView: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        setNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollViewHeight = tableView.frame.size.height
        scrollContentSizeHeight = tableView.contentSize.height
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = APP_NAME
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    @IBAction func onButtonRefresh(_ sender: Any) {
        presenter?.getPokedexEntries(dexView: self)
    }
    
    @objc func rotated() {
        if isLoading {
            showLoading()
        }
    }
    
    // MARK: - DexView Protocol
    
    func setPokedexData(pokedexEntries: [PokemonBasicModel]) {
        self.pokedex.append(contentsOf: pokedexEntries)
        self.viewDexError.isHidden = true
        self.tableView.isHidden = false
        self.tableView.reloadData()
    }
    
    func setPokedexError() {
        self.tableView.isHidden = true
        self.viewDexError.isHidden = false
    }
    
    func showAlert(message: String) {
        let action = UIAlertAction(title: "OK", style: .default)
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

extension DexViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let id = pokedex[indexPath.row].id, let name = pokedex[indexPath.row].name {
            navigationController?.pushViewController(Router.sharedInstance.loadDetailScreen(id: id, name: name), animated: true)
            isScrolling = true
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y

        if let _ = scrollViewHeight, let _ = scrollContentSizeHeight, let dexPresenter = presenter {
            if (scrollOffset > 0 && scrollOffset >= scrollView.contentSize.height - scrollView.frame.size.height && dexPresenter.pageNum <= 15 && !isScrolling) {
                isScrolling = true
                dexPresenter.getPokedexEntries(dexView: self)
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isScrolling = false
    }
    
}

extension DexViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: DexEntryCell.identifier) as? DexEntryCell else {
            return UITableViewCell()
        }
        
        let data = DexEntryCellData(pokemonBasicModel: pokedex[indexPath.row])
        cell.setData(data)
        
        return cell
    }
    
}
