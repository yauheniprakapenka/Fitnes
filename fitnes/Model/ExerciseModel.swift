//
//  ExerciseModel.swift
//  fitnes
//
//  Created by yauheni prakapenka on 19.07.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

var exercises = [exerciseModel]()

struct exerciseModel: Decodable {
    var name: String
    var type: String
    var description: String
    var equipment: String
    var videoUrl: String
}
