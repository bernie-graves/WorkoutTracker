//
//  Exercise.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/13/23.
//

import Foundation

class Exercise: Codable, ObservableObject, Identifiable {
    
    var exerciseID = UUID()
    
    var exerciseName: String
    
    // initialize a sets object to keep track of sets
    // the string will be the UUID
    // Int is number of reps
    // Float is weight
    var sets:  [SetObject] = [SetObject(reps: 8, weight: 100),
                              SetObject(reps: 10, weight: 100)]
        
    
    var exerciseStartTime: Date
    var exerciseEndTime: Date?
    
    var duration = 0
    
    var durationHours: Int {
        duration / 3600
    }

    var durationMinutes: Int {
      (duration % 3600) / 60
    }

    var durationSeconds: Int {
        duration % 60
    }
    
    init(exerciseName: String) {
        self.exerciseName = exerciseName
        self.exerciseStartTime = Date()
    }
    
    func addSet(set: SetObject) {
        sets.append(set)
        print("ADDED SET")
        print("Current Sets: \(sets.count)")
    }
}
