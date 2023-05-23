//
//  CurrentExerciseCompletedSets.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/13/23.
//

import SwiftUI

struct CurrentExerciseCompletedSets: View {
    
    @EnvironmentObject var workoutModel: WorkoutModel
    
    

    var body: some View {
        
        // makes sure there is a current exercise
        if workoutModel.currentWorkout.currentExercise != nil {
            let setsCompleted = workoutModel.currentWorkout.currentExercise!.sets.count
            let rows = (setsCompleted / 2) + 1
            
            if (setsCompleted > 0) {
                
                
                ScrollView(showsIndicators: false){
                    ForEach(0..<rows, id:\.self) { row in // create number of rows
                        HStack {
                            ForEach(0..<2) { column in // create 2 column
                                let setIndex = row * 2 + column
                                // Check if index is in exersises sets
                                // last row throwing out of bounds errors on sets
                                
                                
                                if (setIndex < workoutModel.currentWorkout.currentExercise!.sets.count) {
                                    let set = workoutModel.currentWorkout.currentExercise!.sets[setIndex]
                                    CurrentExerciseSet(reps: set.reps, weight: Int(set.weight))
                                }
                                
                            }
                        }
                    }
                    
                }
                .frame(width: 350, height: 100)
                .padding(.top, 11.0)
                
                
            } else {
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Text("No Sets Yet")
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .bold()
                        Spacer()
                    }
                    Spacer()
                }
                .frame(width: 350, height: 100)
                .padding(.top, 11.0)
            }
        }
    }
}

struct CurrentExerciseCompletedSets_Previews: PreviewProvider {
    static var previews: some View {
        CurrentExerciseCompletedSets()
            .environmentObject(WorkoutModel())
    }
}
