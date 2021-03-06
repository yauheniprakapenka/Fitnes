//
//  FViewColors.swift
//  fitnes
//
//  Created by yauheni prakapenka on 16.08.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class FViewColors: UIView {
    
    let stackView = UIStackView()
    
    let blueView = UIView()
    let pinkView = UIView()
    let orangeView = UIView()
    
    let checkmarkImageView = UIImageView()
    let checkmarkImage = UIImage(systemName: "checkmark")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        
        stackView.addArrangedSubview(blueView)
        stackView.addArrangedSubview(pinkView)
        stackView.addArrangedSubview(orangeView)
        blueView.translatesAutoresizingMaskIntoConstraints = false
        pinkView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        
        blueView.backgroundColor = ColorConverter.shared.stringToColor(string: "blue")
        orangeView.backgroundColor = ColorConverter.shared.stringToColor(string: "orange")
        pinkView.backgroundColor = ColorConverter.shared.stringToColor(string: "pink")
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor) .isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func shaowChechmark(view: ViewColorEnum) {
        switch view {
        case .blueView:
            configureCheckmark(view: blueView)
        case .pinkView:
            configureCheckmark(view: pinkView)
        case .orangeView:
            configureCheckmark(view: orangeView)
        }
    }
    
    private func configureCheckmark(view: UIView) {
        view.addSubview(checkmarkImageView)
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.image = checkmarkImage
        checkmarkImageView.alpha = 1
        
        checkmarkImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkmarkImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        checkmarkImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        checkmarkImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
