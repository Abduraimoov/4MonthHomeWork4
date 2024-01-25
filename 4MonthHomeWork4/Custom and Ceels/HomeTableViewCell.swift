//
//  HomeTableViewCell.swift
//  4MonthHomeWork4
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    private let productImageView: UIImageView = {
        let view  = UIImageView()
        view.image = UIImage(named: "productImage_1")
        view.layer.cornerRadius = 11
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .secondarySystemBackground
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productNameLabel: UILabel = {
        let view  = UILabel()
        view.text = "Product Name"
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productItemsLabel:  UILabel = {
        let view  = UILabel()
        view.text = "Items"
        view.textColor = #colorLiteral(red: 0.570460856, green: 0.570460856, blue: 0.570460856, alpha: 1)
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup(){
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productItemsLabel)
    }
    
    private func setupConstraints()  {
        NSLayoutConstraint.activate([
            //ProductImageView
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 166),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            //ProductNameLabel
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            
            //ProductItemsLabel
            productItemsLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 2),
            productItemsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            
        ])
    }
    
    func configure(with product: Product) {
        productImageView.image = product.productImage
        productNameLabel.text = product.productName
        productItemsLabel.text = product.item
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


