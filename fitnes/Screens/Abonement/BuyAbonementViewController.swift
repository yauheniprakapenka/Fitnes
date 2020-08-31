//
//  BuyAbonement.swift
//  fitnes
//
//  Created by yauheni prakapenka on 12.08.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class BuyAbonementViewController: UIViewController {
    
    // MARK: - Variables
    
    var abonement: AbonementModel!
    
    let backButton = UIButton()
    let buyButton = UIButton()
    
    let abonementNameLabel = FLabel(fontSize: 34, weight: .semibold, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), message: "Не указано")
    let costLabel = FLabel(fontSize: 26, weight: .regular, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), message: "Не указано")
    
    let trainingLeftNumber = FLabel(fontSize: 72, weight: .bold, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), message: "Не указано")
    let trainingLeftText = FLabel(fontSize: 24, weight: .semibold, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), message: "Не указано")
    
    // MARK: - View Controller LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9694514871, green: 0.9644967914, blue: 0.9688283801, alpha: 1)
        
        configureBackButton()
        
        configureAbonementNameLabel()
        configureCostLabel()
        configureBuyButton()
        
        configureTrainingLeftNumber()
        configureTrainingLeftText()
    }
    
    // MARK: - Private Methods
    
    private func configureBackButton() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Назад", for: .normal)
        backButton.setTitleColor(#colorLiteral(red: 0.4109300077, green: 0.4760656357, blue: 0.9726527333, alpha: 1), for: .normal)
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        backButton.addTarget(self, action: #selector(backButtonTapepd), for: .touchUpInside)
    }
    
    private func configureAbonementNameLabel() {
        view.addSubview(abonementNameLabel)
        abonementNameLabel.text = abonement.abonementName
        abonementNameLabel.numberOfLines = 2
        
        abonementNameLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 60).isActive = true
        abonementNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        abonementNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureCostLabel() {
        view.addSubview(costLabel)
        costLabel.text = abonement.cost
        
        costLabel.topAnchor.constraint(equalTo: abonementNameLabel.bottomAnchor, constant: 30).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        costLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureBuyButton() {
        view.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.cornerRadius = 25
        buyButton.backgroundColor = #colorLiteral(red: 0.9124824405, green: 0.3163054287, blue: 0.4536244273, alpha: 1)
        buyButton.titleLabel?.font = UIFont(name: "Helvetica", size: 15)
        buyButton.setTitle("КУПИТЬ", for: .normal)
        
        buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    private func configureTrainingLeftNumber() {
        view.addSubview(trainingLeftNumber)
        trainingLeftNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        trainingLeftNumber.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trainingLeftNumber.text = String(abonement.countVisit)
    }
    
    private func configureTrainingLeftText() {
        view.addSubview(trainingLeftText)
        trainingLeftText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        trainingLeftText.topAnchor.constraint(equalTo: trainingLeftNumber.bottomAnchor, constant: 20).isActive = true
        trainingLeftText.text = "ТРЕНИРОВОК"
    }
    
    // MARK: - Actions
    
    @objc
    private func backButtonTapepd() {
        dismiss(animated: true)
    }
    
    @objc
    private func confirmButtonTapped() {
        print(#function)
        dismiss(animated: true) {
            let vc = AthleteViewController()
            vc.athleteAbonement.insert(self.abonement, at: 0)
            vc.reloadData()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    @objc
    func buyButtonTapped() {
        let alertVC = AlertViewController(question: "Вы хотите купить\nабонемент?", description: "После покупки он отобразится\nв вашем профиле", actionButtonTitle: "Купить", cancelButtonTitle: "Отмена", icon: .chevronDownCircle)
        alertVC.modalPresentationStyle = .overCurrentContext
        
        alertVC.actionButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        
        present(alertVC, animated: true)
    }
}