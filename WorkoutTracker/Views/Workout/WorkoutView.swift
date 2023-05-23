//
//  WorkoutView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

struct WorkoutView: View {
    
    @EnvironmentObject var workoutModel: WorkoutModel
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color("MainDark"), Color("Main")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            if workoutModel.hasStartedWorkout {
                VStack {
                    
                    WorkoutTimer()
                        .padding(.top, 10.0)
                    
                    // only show current exercise or start new exercise is user is in workout
                    if (workoutModel.hasStartedWorkout ) {
                        if (workoutModel.activeExercise){
                            // Current Exercise View
                            CurrentExercise()
                                .padding()
                        } else {
                            // Start Exercise View
                            StartExerciseView()
                                .padding()
                        }
                    }
                    
                    CompletedExercisesView()
                    
                    Spacer()
                }
            } else {
                // show start exercise button
                StartWorkoutButton()
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
            .environmentObject(WorkoutModel())
    }
}
