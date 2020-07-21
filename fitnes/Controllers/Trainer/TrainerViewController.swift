//
//  TrainerViewController.swift
//  fitnes
//
//  Created by yauheni prakapenka on 18.07.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class TrainerViewController: UIViewController {
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirestoreService.shared.isTrainerExist() {
            FirestoreService.shared.createTrainer(uid: profileInfo.uid)
        }
        
        fetchProfileExercises()
    }
    
    // MARK: - IBActions
    
    @IBAction func exerciseButtonTapped(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ExerciseVC") as! ExcersisesViewController
        present(vc, animated: true)
    }
    
    // MARK: - Private methods
    
    private func fetchProfileExercises() {
        let semaphore = DispatchSemaphore(value: 1)
        
        DispatchQueue.global().async {
            semaphore.wait()
            FirestoreService.shared.fetchExercisesList() {
                semaphore.signal()
            }
        }
        
        DispatchQueue.global().async {
            semaphore.wait()
            FirestoreService.shared.fetchExercises(userListExercises: exersisesList.exercises)
            semaphore.signal()
        }
    }
}
