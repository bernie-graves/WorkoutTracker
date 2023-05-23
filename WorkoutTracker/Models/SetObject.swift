//
//  Set.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/13/23.
//

import Foundation

class SetObject: Codable, ObservableObject, Hashable {
    
    var setID = UUID()
    
    var time = Date()
    
    var reps: Int
    var weight: Float
    
    init(reps: Int, weight: Float){
        self.reps = reps
        self.weight = weight

    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(setID)
    }
    
    static func == (lhs: SetObject, rhs: SetObject) -> Bool {
        return lhs.setID == rhs.setID
    }
}
