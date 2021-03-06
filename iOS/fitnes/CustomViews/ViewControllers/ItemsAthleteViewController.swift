//
//  ItemsAthleteViewController.swift
//  fitnes
//
//  Created by yauheni prakapenka on 07.08.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ItemsAthleteViewController: UIViewController {

    let topHorisontalLineView = FViewHorisontalLine()
    let bottomHorisontalLineView = FViewHorisontalLine()
    let stackView = UIStackView()
    let programView = FViewItem(message: "Программ", count: "15")
    let actionButton = FButtonWithBackgroundColor(backgroundColor: #colorLiteral(red: 0.4109300077, green: 0.4760656357, blue: 0.9726527333, alpha: 1), title: "Найти тренера", size: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureStackView()
    }
    
    private func configureLayout() {
        view.addSubview(topHorisontalLineView)
        view.addSubview(stackView)
        view.addSubview(bottomHorisontalLineView)
        
        topHorisontalLineView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomHorisontalLineView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topHorisontalLineView.topAnchor.constraint(equalTo: view.topAnchor),
            topHorisontalLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topHorisontalLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topHorisontalLineView.heightAnchor.constraint(equalToConstant: 1),

            stackView.topAnchor.constraint(equalTo: topHorisontalLineView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            
            bottomHorisontalLineView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            bottomHorisontalLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomHorisontalLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomHorisontalLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(programView)
        stackView.addArrangedSubview(actionButton)
    }
    
}
