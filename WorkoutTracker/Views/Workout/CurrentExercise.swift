//
//  CurrentWorkout.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/13/23.
//

import SwiftUI
import Combine

struct CurrentExercise: View {
    
    init() {
        UIStepper.appearance().setDecrementImage(UIImage(systemName: "minus"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(systemName: "plus"), for: .normal)
    }
    
    @State private var currentReps = 0
    @State private var currentWeight = 0
    @State private var showAddSetPage = false
    
    @EnvironmentObject var workoutModel: WorkoutModel
    
    
    var body: some View {
        if workoutModel.currentWorkout.currentExercise != nil {
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 350, height: 225)
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .layoutPriority(1)
                
                VStack(spacing:0) {
                    
                    HStack {
                        
                        
                        Text("\(workoutModel.currentWorkout.currentExercise!.exerciseName)")
                                .foregroundColor(.white)
                                .padding([.top, .leading])
                                .padding(.bottom, 3)
                                .bold()
                        

                        Spacer()
                        
                        // Show timer for current workout
                        Text("\(workoutModel.minutesCurrentExercise < 10 ? "0" + String(workoutModel.minutesCurrentExercise) : String(workoutModel.minutesCurrentExercise)):\(workoutModel.secondsCurrentExercise < 10 ? "0" + String(workoutModel.secondsCurrentExercise) : String(workoutModel.secondsCurrentExercise))")
                            .foregroundColor(.white)
                            .padding([.top, .trailing])
                            .padding(.bottom, 3)
                            .bold()
                    }
                    Rectangle()
                        .frame(width:350, height: 2)
                        .foregroundColor(Color("Main"))

                    CurrentExerciseCompletedSets()

                
                    HStack {
                        Spacer()
                        Button {
                            // Add set to workout -- screen pop up to add reps and sets
                            self.showAddSetPage.toggle()
                            
                            // reset reps and weight
                        } label: {
                            Text("ADD SET")
                                .frame(width: 140, height: 40)
                                .background(Color("Main"))
                                .foregroundColor(.black)
                                .cornerRadius(4)
                                .bold()
                        }
                        .padding()
                        
                        Spacer()
                        Button {
                            // Finish Exercise and go to next one or finish workout
                            // make sure their is a current exercise
                            if workoutModel.currentWorkout.currentExercise != nil {
                                workoutModel.FinishExercise()
                            }
                            
                        } label: {
                            Text("FINISH")
                                .frame(width: 140, height: 40)
                                .background(Color("Secondary"))
                                .foregroundColor(.black)
                                .cornerRadius(4)
                                .bold()
                        }
                        .padding()

                        Spacer()
                    }



                }
            }
            .sheet(isPresented: $showAddSetPage) {
                AddSetView(showAddSetPage: $showAddSetPage)
                    .presentationDetents([.fraction(0.4)])
            }
        }
    }
}

struct CurrentWorkout_Previews: PreviewProvider {
    static var previews: some View {
        CurrentExercise()
            .environmentObject(WorkoutModel())
    }
}
