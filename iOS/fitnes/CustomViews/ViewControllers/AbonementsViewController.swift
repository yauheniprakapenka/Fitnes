//
//  AbonementsViewController.swift
//  fitnes
//
//  Created by yauheni prakapenka on 07.08.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

enum CurrentVCEnum {
    case athletVC
    case trainerVC
    case trainerFormSearch
}

class AbonementsViewController: UIViewController {
    
    var currentVC: CurrentVCEnum = .athletVC
    
    var titleLabel = FLabel(fontSize: 17, weight: .bold, color: .black, message: "Купленные мной абонементы")
    var abonements: [AbonementModel] = []
    let emptyAbonementImageView = UIImageView()
    let createButton = UIButton()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AbonementsCollectionCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTitleLabel()
        configureCollectionView()
        configureUIElements()
        configureEmptyAbonementImageView()
        configureMoreButton()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configureEmptyAbonementImageView() {
        view.addSubview(emptyAbonementImageView)
        emptyAbonementImageView.contentMode = .scaleAspectFit
        
        emptyAbonementImageView.translatesAutoresizingMaskIntoConstraints = false
        emptyAbonementImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        emptyAbonementImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emptyAbonementImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emptyAbonementImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    private func configureUIElements() {
        collectionView.backgroundColor = .white
    }
    
    private func configureMoreButton() {
        guard createButton.titleLabel != nil else { return }
        
        view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        createButton.setTitleColor(#colorLiteral(red: 0.4109300077, green: 0.4760656357, blue: 0.9726527333, alpha: 1), for: .normal)
        createButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
    }
}

extension AbonementsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)// collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if abonements.count < 1 {
            emptyAbonementImageView.alpha = 1
        } else {
            emptyAbonementImageView.alpha = 0
        }
        
        return abonements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AbonementsCollectionCell
        cell.data = self.abonements[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 8.0
        cell.layer.shadowOpacity = 0.1
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch currentVC {
        case .athletVC:
            let vc = AthleteQRAbonementViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.abonement = abonements[indexPath.row]
            present(vc, animated: true)
        case .trainerVC:
            break
        case .trainerFormSearch:
            let vc = BuyAbonementViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.abonement = abonements[indexPath.row]
            present(vc, animated: true)
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}
