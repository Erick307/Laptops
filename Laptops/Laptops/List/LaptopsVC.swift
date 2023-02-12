//
//  ViewController.swift
//  Laptops
//
//  Created by Erick Silva on 11/02/2023.
//

import UIKit

class LaptopsVC: UIViewController {
    
    let presenter = LaptopsPresenter()
    
    let refreshControl : UIRefreshControl = {
        let r = UIRefreshControl()
        return r
    }()
    
    lazy var tableView : UITableView = {
        let t = UITableView(frame: CGRect.zero)
        t.delegate = self
        t.dataSource = self
        t.allowsSelection = true
        t.rowHeight = UITableView.automaticDimension
        t.backgroundColor = UIColor.white
        t.translatesAutoresizingMaskIntoConstraints = false
        t.register(LaptopCell.self, forCellReuseIdentifier: "laptop")
        t.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        t.refreshControl = refreshControl
        return t
    }()
    
    static func getViewController() -> UIViewController{
        
        let nav = UINavigationController(rootViewController: LaptopsVC())
        nav.setNavigationBarHidden(false, animated: false)
        return nav
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.bind(self)
        presenter.updateLaptops()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.unbind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Laptops"
        view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
    }
    
    @objc func refreshTable() {
        presenter.updateLaptops()
    }
    
    func navigateToDeatil(laptop: Laptop){
        let detailVC = LaptopDetailVC.getViewController(laptop: laptop)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension LaptopsVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.laptops.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "laptop", for: indexPath) as! LaptopCell
        cell.setLaptop(laptop: presenter.laptops[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDeatil(laptop: presenter.laptops[indexPath.row])
    }
}

extension LaptopsVC : LaptopsView {
    
    func refresh() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}

