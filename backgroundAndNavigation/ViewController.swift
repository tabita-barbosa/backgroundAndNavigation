//
//  ViewController.swift
//  backgroundAndNavigation
//
//  Created by Tabita Barbosa on 02/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    // colors
    let lightGreen = UIColor(named: "lightGreen")
    let darkGreen = UIColor(named: "darkGreen")
    let terracotaBtn = UIColor(named: "darkBrown")
    let lightBrown = UIColor(named: "lightBrown")
    let lightBackground = UIColor(named: "lightBackground")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = lightGreen
        self.setupView()
    }

    private let buttonBackground: UIButton = {
        let btn = UIButton()
        btn.setTitle("trocar background", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(changeBackground), for: .touchUpInside)
        return btn
    }()
    
    @objc
    func changeBackground(sender: UIButton) {
        if view.backgroundColor == lightGreen {
            self.view.backgroundColor = darkGreen
            buttonBackground.backgroundColor = lightBackground
        } else if view.backgroundColor == darkGreen {
            self.view.backgroundColor = lightGreen
            buttonBackground.backgroundColor = lightBrown
        }
    }
    
    private let buttonNavigate: UIButton = {
        let btn = UIButton()
        btn.setTitle("ir para segunda tela", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(navigateToSecondScreen), for: .touchUpInside)
        return btn
    }()
    
    @objc
    func navigateToSecondScreen(sender: UIButton) {
        let secondView = SecondScreenViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    
    func setupView() {
        navigationItem.title = "Primeira Tela"
        
        self.view.addSubview(self.buttonBackground)
        self.view.addSubview(self.buttonNavigate)
        self.setupViewConstraints()
        self.btnBackgroundConstraints()
        self.btnNavigateConstraints()
    }
    
    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
            view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func btnBackgroundConstraints() {
        self.buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        self.buttonBackground.backgroundColor = lightBrown
        self.buttonBackground.layer.cornerRadius = 5
        self.buttonBackground.layer.borderWidth = 3
        self.buttonBackground.layer.borderColor = terracotaBtn?.cgColor
        
        NSLayoutConstraint.activate([
            buttonBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonBackground.widthAnchor.constraint(equalToConstant: 200.0),
            buttonBackground.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
    
    
    func btnNavigateConstraints() {
        self.buttonNavigate.translatesAutoresizingMaskIntoConstraints = false
        self.buttonNavigate.backgroundColor = lightBrown
        self.buttonNavigate.layer.cornerRadius = 5
        self.buttonNavigate.layer.borderWidth = 3
        self.buttonNavigate.layer.borderColor = terracotaBtn?.cgColor
        
        NSLayoutConstraint.activate([
            buttonNavigate.topAnchor.constraint(equalTo: buttonBackground.bottomAnchor, constant: 48.0),
            buttonNavigate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonNavigate.widthAnchor.constraint(equalToConstant: 200.0),
            buttonNavigate.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
}

