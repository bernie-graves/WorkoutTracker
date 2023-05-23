//
//  WorkoutModel.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/4/23.
//

import Foundation
import SwiftUI

class WorkoutModel: ObservableObject {
    
    
    @Published var progressTime: Int
    
    // this bool toggles the timer
    @Published var isWorkingOut: Bool
    
    // this bool tells whether their is an ongoing workout -- includes when paused
    @Published var hasStartedWorkout: Bool
    
    @Published var currentWorkout: Workout
    
    @Published var activeExercise = false
    @Published var currentExercise: Exercise?
    @Published var currentExerciseTime: Int = 0
    
    @Published var listOfExercises: [String]
    
    var timer: Timer?
    
    var hours: Int {
      progressTime / 3600
    }

    var minutes: Int {
      (progressTime % 3600) / 60
    }

    var seconds: Int {
      progressTime % 60
    }

    var minutesCurrentExercise: Int {
      (currentExerciseTime % 3600) / 60
    }

    var secondsCurrentExercise: Int {
        currentExerciseTime % 60
    }
    
    init(){
        self.progressTime = 0
        self.isWorkingOut = false
        self.hasStartedWorkout = false
        
        // for testing
        self.currentWorkout = Workout(startTime: Date(), endTime: Date())
        self.currentExercise = Exercise(exerciseName: "Bench Press")
        
        
        // get users exercises
        self.listOfExercises = UserDefaults.standard.array(forKey: "exercises") as? [String] ?? ["Back Squat", "Bench Press", "Deadlift"]
    }
    
    func StartWorkout(){
        //start workout
        
        withAnimation(.easeInOut(duration: 1)) {
            self.isWorkingOut = true
            self.hasStartedWorkout = true
            
            // start timer
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                self.progressTime += 1
                self.currentExerciseTime += 1
                                    })
        }

    }
    
    func StopWorkout(){
        
        withAnimation(.spring(response: 0.85, dampingFraction: 0.5)) {
            self.isWorkingOut = false
            self.hasStartedWorkout = false
            self.activeExercise = false
            
            // reset timers
            self.progressTime = 0
            self.currentExerciseTime = 0
            
            // reset workout -- if you end a workout the exercise also ends
            // TODO: Make function in Workout that finishes current workout -- needs to end and save current exercise
            // temp solution
            self.currentWorkout.currentExercise = nil
            
            self.timer?.invalidate()
            
        }
        // save workout
        

    }
    
    func PauseWorkout(){
        
        withAnimation(.spring(response: 0.85, dampingFraction: 0.5)) {
            self.isWorkingOut = false
            self.timer?.invalidate()
        }
    }
    
    func ResumeWorkout(){
        
        withAnimation(.spring(response: 0.85, dampingFraction: 0.5)) {
            self.isWorkingOut = true
            
            // restart timer
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                self.progressTime += 1
                self.currentExerciseTime += 1
            })
        }
    }
    
    func AddedSet(){
        withAnimation(.spring(response: 0.9, dampingFraction: 0.4)){
            self.objectWillChange.send()
        }
    }
    
    func StartExercise(exerciseName: String){
        
        withAnimation{
            self.currentWorkout.currentExercise = Exercise(exerciseName: exerciseName)
            self.activeExercise = true
            self.currentExerciseTime = 0
        }
        
        
        
    }
    
    
    // call when you finish current excercise
    func FinishExercise(){
        
        withAnimation(.spring(response: 0.9, dampingFraction: 0.7)){
            currentWorkout.finishCurrentExcercise(duration: currentExerciseTime)
            self.activeExercise = false
        }

    }
    
    
    // add new excercise type -- i.e. Bench Press, Squat...
    func AddNewExercise(newExercise: String){
        
        // add to userDefaults
        self.listOfExercises.append(newExercise)
        
        UserDefaults.standard.set(self.listOfExercises, forKey: "exercises")
        
        
        // TODO: Add to Firebase
    }
    
    
}
