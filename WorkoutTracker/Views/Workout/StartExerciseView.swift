//
//  StartExerciseView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/15/23.
//

import SwiftUI

struct StartExerciseView: View {
    
    @EnvironmentObject var workoutModel: WorkoutModel
    
    @State var showWorkoutSelector = false
    @State var selectedWorkout: String?
    
    var body: some View {
        
        
        VStack{
            Button {
                // Start an Exercise -- call
                print("START EXERCISE")
                self.showWorkoutSelector.toggle()
                
            } label: {
                Text("START EXERCISE")
                    .foregroundColor(Color("Main"))
                    .bold()
                    .font(.title2)
                    .frame(width: 350, height: 100)
                    .background(Color("MainDark"))
                    .cornerRadius(50)
            }
        }
        .sheet(isPresented: $showWorkoutSelector, content: {
            
            // View to select what workout is next
            VStack {
                HStack{
                    
                }
                List {
                    ForEach(workoutModel.listOfExercises, id:\.self){ ex in
                        
                        Text("\(ex)")
                            .onTapGesture {
                                selectedWorkout = ex
                                workoutModel.StartExercise(exerciseName: ex)
                            }
                        
                    }
                }
            }
            .presentationDetents([.fraction(0.5)])
            
        })

    }
}

struct StartExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        StartExerciseView()
            .environmentObject(WorkoutModel())
    }
}
