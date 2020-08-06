//
//  MainViewController.swift
//  fitnes
//
//  Created by yauheni prakapenka on 27.07.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        
        let vc = NewTrainerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func qrButtonTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "qrCodeId") as! QRGeneratorViewController
        
        present(vc, animated: true)
    }
    
    
}
