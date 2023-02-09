//
//  CafeRioViewController.swift
//  DemoProgrammaticUIKit
//
//  Created by Aaron Martinez on 2/8/23.
//

import UIKit

class CafeRioViewController: UIViewController {
    
    lazy var pointsSection: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var graffatiView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var foodImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "fork.knife.circle.fill")
        return view
    }()
    
    lazy var pointsButtonsBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pointsButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20.0
        return stackView
    }()
    
    lazy var earnButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBrown
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(earnButtonTapped), for: .touchUpInside)
        button.setTitle("Earn", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var redeemButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(redeemButtonTapped), for: .touchUpInside)
        button.setTitle("Redeem", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cafe Rio Rewards"
        
        view.backgroundColor = .red
        view.addSubview(pointsSection)
        
        // Graffiti section
        pointsSection.addSubview(graffatiView)
        graffatiView.addSubview(borderView)
        borderView.addSubview(foodImageView)
        // Points Buttons Box
        pointsSection.addSubview(pointsButtonsBoxView)
        pointsButtonsBoxView.addSubview(pointsButtonsStackView)
        pointsButtonsStackView.addArrangedSubview(earnButton)
        pointsButtonsStackView.addArrangedSubview(redeemButton)
        
        NSLayoutConstraint.activate([
            pointsSection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pointsSection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pointsSection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pointsSection.heightAnchor.constraint(equalToConstant: view.frame.width - 40),

            graffatiView.leadingAnchor.constraint(equalTo: pointsSection.leadingAnchor),
            graffatiView.topAnchor.constraint(equalTo: pointsSection.topAnchor),
            graffatiView.trailingAnchor.constraint(equalTo: pointsSection.trailingAnchor),
            graffatiView.heightAnchor.constraint(equalTo: pointsSection.heightAnchor, multiplier: 0.75),
            
            pointsButtonsBoxView.leadingAnchor.constraint(equalTo: pointsSection.leadingAnchor),
            pointsButtonsBoxView.bottomAnchor.constraint(equalTo: pointsSection.bottomAnchor),
            pointsButtonsBoxView.trailingAnchor.constraint(equalTo: pointsSection.trailingAnchor),
            pointsButtonsBoxView.heightAnchor.constraint(equalTo: pointsSection.heightAnchor, multiplier: 0.25),
            
            borderView.heightAnchor.constraint(equalTo: graffatiView.heightAnchor, multiplier: 0.85),
            borderView.widthAnchor.constraint(equalTo: graffatiView.heightAnchor, multiplier: 0.85),
            borderView.centerYAnchor.constraint(equalTo: graffatiView.centerYAnchor),
            borderView.centerXAnchor.constraint(equalTo: graffatiView.centerXAnchor),
            
            foodImageView.heightAnchor.constraint(equalTo: borderView.heightAnchor, multiplier: 0.9),
            foodImageView.widthAnchor.constraint(equalTo: borderView.heightAnchor, multiplier: 0.9),
            foodImageView.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
            foodImageView.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            
            pointsButtonsStackView.leadingAnchor.constraint(equalTo: pointsButtonsBoxView.leadingAnchor, constant: 12),
            pointsButtonsStackView.topAnchor.constraint(equalTo: pointsButtonsBoxView.topAnchor, constant: 4),
            pointsButtonsStackView.trailingAnchor.constraint(equalTo: pointsButtonsBoxView.trailingAnchor, constant: -12),
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // These need to be set after the layout engine has drawn the views on screen. Otherwise, the frame will not have a value yet.
        borderView.layer.cornerRadius = borderView.frame.width / 2
        foodImageView.layer.cornerRadius = foodImageView.frame.width / 2
    }
    
    @objc func earnButtonTapped() {
        // Example of `pushing` onto the navigation stack
        navigationController?.pushViewController(EarnViewController(), animated: true)
    }
    
    @objc func redeemButtonTapped() {
        // Example of `presenting` a modal
        present(RedeemViewController(), animated: true)
    }
}
