//
//  AddSetView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/14/23.
//

import SwiftUI

struct AddSetView: View {
    
    @EnvironmentObject var workoutModel: WorkoutModel
    
    @Binding var showAddSetPage: Bool
    
    @State private var reps: Int = 8
    @State private var weight: Int = 50
    
    var body: some View {
        VStack {
            
            HStack(spacing: 0) {
                Spacer()
                // Reps VStack
                VStack {
                    Text("REPS")
                    Picker("reps", selection: $reps) {
                        ForEach(0...100, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 100, height: 150)
                }
                .padding(.horizontal, 10.0)
                

                
                // weight VStack
                VStack{
                    Text("WEIGHT")
                    Picker("weight", selection: $weight) {
                        ForEach(Array(stride(from:0, through:1000, by:5)), id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 150, height: 150)
                }
                .padding(.leading, 10.0)
                Spacer()
            }
            
            HStack{
                
                // cancel button
                Button {
                    // reset showAddSet and don't add the set/rep
                    self.showAddSetPage.toggle()
                } label: {
                    Text("CANCEL")
                        .frame(width: 150, height: 50)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                // add button
                // cancel button
                Button {
                    // reset showAddSet and don't add the set/rep
                    self.showAddSetPage.toggle()
                    guard workoutModel.currentWorkout.currentExercise != nil else {
                        return
                    }
                    workoutModel.currentWorkout.currentExercise!.addSet(set: SetObject(reps: reps, weight: Float(weight)))

                    //updates the published object manually
                    workoutModel.AddedSet()
                    
                } label: {
                    Text("ADD")
                        .frame(width: 150, height: 50)
                        .background(Color("Main"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .bold()
                }
            }
        }
    }
}

struct AddSetView_Previews: PreviewProvider {
    static var previews: some View {
        AddSetView( showAddSetPage: .constant(true))
            .environmentObject(WorkoutModel())
    }
}
