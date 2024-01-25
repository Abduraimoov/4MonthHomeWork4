//
//  StarsView.swift
//  4MonthHomeWork4
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class StarsView: UIView {
    
    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let star1: UIImageView = {
       let view  = UIImageView()
        view.tintColor = .systemYellow
        view.image = UIImage(named: "star.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 12.53),
            view.widthAnchor.constraint(equalToConstant: 12.94)
        ])
        return view
    }()
    
    private let star2: UIImageView = {
       let view  = UIImageView()
        view.tintColor = .systemYellow
        view.image = UIImage(named: "star.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 12.53),
            view.widthAnchor.constraint(equalToConstant: 12.94)
        ])
        return view
    }()
    
    private let star3: UIImageView = {
       let view  = UIImageView()
        view.tintColor = .systemYellow
        view.image = UIImage(named: "star.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 12.53),
            view.widthAnchor.constraint(equalToConstant: 12.94)
        ])
        return view
    }()
    
    private let star4: UIImageView = {
       let view  = UIImageView()
        view.tintColor = .systemYellow
        view.image = UIImage(named: "star.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 12.53),
            view.widthAnchor.constraint(equalToConstant: 12.94)
        ])
        return view
    }()
    
    private let star5: UIImageView = {
       let view  = UIImageView()
        view.tintColor = .systemYellow
        view.image = UIImage(named: "star.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 12.53),
            view.widthAnchor.constraint(equalToConstant: 12.94)
        ])
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(starsStackView)
        starsStackView.addArrangedSubview(star1)
        starsStackView.addArrangedSubview(star2)
        starsStackView.addArrangedSubview(star3)
        starsStackView.addArrangedSubview(star4)
        starsStackView.addArrangedSubview(star5)
       
        
        NSLayoutConstraint.activate([
            starsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starsStackView.topAnchor.constraint(equalTo: topAnchor),
            starsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
