//
//  FindTrainerCollectionCell.swift
//  fitnes
//
//  Created by yauheni prakapenka on 08.08.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class FindTrainerCollectionCell: UICollectionViewCell {

    var data: TrainerModel? {
        didSet {
            guard let data = data else { return }
            avatarImage.image = data.avatarImage
            trainerNameLabel.text = data.trainerName
            costLabel.text = data.cost
            trainingPlaceLabel.text = data.trainingPlace
        }
    }

    let trainerNameLabel = FLabel(fontSize: 16, weight: .medium, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), message: "Не указано")
    let costLabel = FLabel(fontSize: 14, weight: .regular, color: .gray, message: "Не указано")
    
    let trainingPlaceLabel = FLabel(fontSize: 12, weight: .regular, color: .lightGray, message: "Не указано")

    fileprivate let avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "photo-1476480862126-209bfaa8edc8")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        trainerNameLabel.numberOfLines = 2
        trainingPlaceLabel.numberOfLines = 2
    }

    private func configureLayout() {
        contentView.addSubview(avatarImage)
        contentView.addSubview(trainerNameLabel)
        contentView.addSubview(costLabel)
        contentView.addSubview(trainingPlaceLabel)

        trainerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        trainingPlaceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: contentView.frame.height/1.6).isActive = true

        trainerNameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 10).isActive = true
        trainerNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        trainerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        costLabel.topAnchor.constraint(equalTo: trainerNameLabel.bottomAnchor, constant: 6).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        costLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        trainingPlaceLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 6).isActive = true
        trainingPlaceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        trainingPlaceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
}
