//
//  Workout.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/13/23.
//

import Foundation

class Workout: Codable, Identifiable{
    
    var workoutID = UUID()
    var startTime: Date
    var endTime: Date
    
    var exercises: [Exercise] = []
    var currentExercise: Exercise?
    
    init(startTime: Date, endTime: Date) {
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func addExercise(exercise: Exercise) {
        exercises.append(exercise)
    }
    
    func finishCurrentExcercise(duration: Int){
        
        if currentExercise != nil {
            
            // set current exercises duration and add it to the list
            self.currentExercise?.duration = duration
            self.addExercise(exercise: currentExercise!)
            self.currentExercise = nil
            
            print("Number of completed exercises: \(exercises.count)")
        } else {
            print("No current exercise to add.")
        }

    }
    
}
