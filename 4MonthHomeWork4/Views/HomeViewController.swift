//
//  HomeViewController.swift
//  4MonthHomeWork4
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var products: [Product] = []
    
    private let homeTableView: UITableView = {
        let view  = UITableView()
        view.separatorStyle = .singleLine
        view.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
        setupProducts()
    }
    
    private func setupView() {
        title = "Home"
        view.backgroundColor = .systemBackground
        view.addSubview(homeTableView)
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeTableView.frame = view.bounds
    }
    
    private func setupProducts() {
        let product1 = Product(productImage: UIImage(named: "productImage_1")!,
                               productName: "Furniture",
                               fullProductName: "Furniture, more than wood and nails, shapes home's soul.",
                               item: "785 Items",
                               price: 3671,
                               detailedProductImage: UIImage(named: "productinfo_1")!)
        
        let product2 = Product(productImage: UIImage(named: "productImage_2")!,
                               productName: "Kitchenware",
                               fullProductName: "Kitchenware, in skilled hands, transforms meals into memories.",
                               item: "645 Items",
                               price: 499,
                               detailedProductImage: UIImage(named: "productinfo_2")!)
        
        let product3 = Product(productImage: UIImage(named: "productImage_3")!,
                               productName: "Reading Table",
                               fullProductName: "Reading table: a quiet sanctuary for minds to wander.",
                               item: "Inventory",
                               price: 559,
                               detailedProductImage: UIImage(named: "productinfo_3")!)
        
        products = [product1, product2, product3]
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.configure(with: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               let selectedProduct = products[indexPath.row]
               let vc = DetailedViewController()
               vc.product = selectedProduct
               vc.modalPresentationStyle = .fullScreen
               present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
}
