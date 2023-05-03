//
//  SecondScreenViewController.swift
//  backgroundAndNavigation
//
//  Created by Tabita Barbosa on 02/05/23.
//

import Foundation
import UIKit

class SecondScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkBrown")
        self.setupView()
    }
    
    private let descriptionText: UILabel = {
        let text = UILabel()
        text.text = "esta é a segunda tela!"
        text.textColor = .white
        return text
    }()
    
    func setupView(){
        navigationItem.title = "Segunda Tela"
        
        view.addSubview(self.descriptionText)
        
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionText.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionText.widthAnchor.constraint(equalToConstant: 200.0),
            descriptionText.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
}
