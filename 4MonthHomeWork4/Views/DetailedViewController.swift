//
//  DetailedViewController.swift
//  4MonthHomeWork4
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class DetailedViewController: UIViewController {
    
    public var product: Product?
    
    private let productImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "productinfo_1")
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .secondarySystemBackground
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.tintColor = .black
        view.layer.cornerRadius = 25
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shareButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.tintColor = .black
        view.layer.cornerRadius = 25
        view.setImage(UIImage(named: "share"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let likeButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.tintColor = .black
        view.layer.cornerRadius = 25
        view.setImage(UIImage(named: "heart"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productNameLabel: UILabel = {
        let view  = UILabel()
        view.text = "Product Name"
        view.numberOfLines = 0
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starsImageView = StarsView()
    
    private let productPriceLabel: UILabel = {
        let view = UILabel()
        view.text = "$ "
        view.textColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 20, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 15
        view.tintColor = .black
        view.setImage(UIImage(systemName: "minus"), for: .normal)
        view.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 15
        view.tintColor = .black
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var currentValue = 1
    
    private lazy var countLabel: UILabel = {
        let view = UILabel()
        view.text = "\(self.currentValue)"
        view.textColor = .black
        view.font = .systemFont(ofSize: 20, weight: .medium)
        return view
    }()
    
    //MARK: - Product Details
    private let productDetailsLabel = CustomLabels(text: "Product Details", textColor: .black, font: .systemFont(ofSize: 20, weight: .medium))
    
    private let roomTypeLabel = CustomLabels(text: "Room Type", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), font: .systemFont(ofSize: 15, weight: .medium))
    
    private let roomTypeInfoLabel = CustomLabels(text: "Office, Living Room", textColor: .black, font: .systemFont(ofSize: 15, weight: .medium))
    
    private let colorLabel = CustomLabels(text: "Color", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), font: .systemFont(ofSize: 15, weight: .medium))
    
    private let colorInfoLabel = CustomLabels(text: "Yellow", textColor: .black, font: .systemFont(ofSize: 15, weight: .medium))
    
    private let materialLabel = CustomLabels(text: "Material", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), font: .systemFont(ofSize: 15, weight: .medium))
    
    private let materialInfoLabel = CustomLabels(text: "Yellow", textColor: .black, font: .systemFont(ofSize: 15, weight: .medium))
    
    private let dimensionsLabel = CustomLabels(text: "Dimensions", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), font: .systemFont(ofSize: 15, weight: .medium))
    
    private let dimensionsInfoLabel = CustomLabels(text: "25.6 x 31.5 x 37.4 inches", textColor: .black, font: .systemFont(ofSize: 15, weight: .medium))
    
    private let weightLabel = CustomLabels(text: "Weight", textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), font: .systemFont(ofSize: 15, weight: .medium))
    
    private let weightInfoLabel = CustomLabels(text: "20.3 Pounds", textColor: .black, font: .systemFont(ofSize: 15, weight: .medium))
    
    private lazy var buyButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5694641471, blue: 1, alpha: 1)
        view.layer.cornerRadius = 5
        view.setTitle("Buy", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let verticalStackView: UIStackView = {
         let view = UIStackView()
         view.alignment = .fill
         view.axis = .vertical
         view.spacing = 5
         view.translatesAutoresizingMaskIntoConstraints = false
         return  view
     }()
    private let vertical2StackView: UIStackView = {
         let view = UIStackView()
         view.alignment = .fill
        view.axis = .vertical
         view.spacing = 5
         view.translatesAutoresizingMaskIntoConstraints = false
         return  view
     }()
    
    private let horizontalStackView: UIStackView = {
         let view = UIStackView()
         view.alignment = .fill
        view.axis = .horizontal
         view.spacing = 15
         view.translatesAutoresizingMaskIntoConstraints = false
         return  view
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        getData()
        view.backgroundColor = .systemBackground
        view.addSubview(productImageView)
        view.addSubview(backButton)
        view.addSubview(shareButton)
        view.addSubview(likeButton)
        view.addSubview(productNameLabel)
        view.addSubview(starsImageView)
        view.addSubview(productPriceLabel)
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(minusButton)
        horizontalStackView.addArrangedSubview(countLabel)
        horizontalStackView.addArrangedSubview(plusButton)
        view.addSubview(verticalStackView)
        view.addSubview(productDetailsLabel)
        verticalStackView.addArrangedSubview(roomTypeLabel)
        verticalStackView.addArrangedSubview(colorLabel)
        verticalStackView.addArrangedSubview(materialLabel)
        verticalStackView.addArrangedSubview(dimensionsLabel)
        verticalStackView.addArrangedSubview(weightLabel)
        view.addSubview(vertical2StackView)
        vertical2StackView.addArrangedSubview(roomTypeInfoLabel)
        vertical2StackView.addArrangedSubview(colorInfoLabel)
        vertical2StackView.addArrangedSubview(materialInfoLabel)
        vertical2StackView.addArrangedSubview(dimensionsInfoLabel)
        vertical2StackView.addArrangedSubview(weightInfoLabel)
        view.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        //productimageview
            productImageView.topAnchor.constraint(equalTo: view.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 375),
            
            backButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 55),
            backButton.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            
            shareButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 55),
            shareButton.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -16),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.widthAnchor.constraint(equalToConstant: 50),
            
            likeButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 55),
            likeButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -15),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.widthAnchor.constraint(equalToConstant: 50),
            
        //productNameLabel
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 15),
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
//        //stars
//            starsImageView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 8),
//            starsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
        //productPriceLabel
            productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 43),
            productPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            //horizontalStackView
            horizontalStackView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 39),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            
            minusButton.heightAnchor.constraint(equalToConstant: 32),
            minusButton.widthAnchor.constraint(equalToConstant: 32),
            plusButton.heightAnchor.constraint(equalToConstant: 32),
            plusButton.widthAnchor.constraint(equalToConstant: 32),
            
            //Product Details
            productDetailsLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 27),
            productDetailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            verticalStackView.topAnchor.constraint(equalTo: productDetailsLabel.bottomAnchor, constant: 9),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vertical2StackView.topAnchor.constraint(equalTo: productDetailsLabel.bottomAnchor, constant: 9),
            vertical2StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            //buybutton
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyButton.widthAnchor.constraint(equalToConstant: 344),
            buyButton.heightAnchor.constraint(equalToConstant: 50),
            
        
        ])
    }
    
    private func getData(){
        productImageView.image = product?.detailedProductImage
        productNameLabel.text = product?.fullProductName
        updatePriceDisplay()
    }
    
    private func updatePriceDisplay() {
        if let product = product {
            let totalPrice = product.totalPrice(for: currentValue)
            productPriceLabel.text = "$\(totalPrice)"
        }
    }

    
    //MARK: - @objc functions
    
    @objc private func goBack() {
        self.dismiss(animated: true)
    }
    
    @objc private func minusButtonTapped(){
        if currentValue > 1 {
             currentValue -= 1
            updatePriceDisplay()
            countLabel.text = "\(currentValue)"
         }
    }
    
    @objc private func plusButtonTapped(){
        currentValue += 1
          countLabel.text = "\(currentValue)"
        updatePriceDisplay()
    }

}
