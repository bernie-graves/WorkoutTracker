//
//  StartWorkoutButton.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/19/23.
//

import SwiftUI

struct StartWorkoutButton: View {
    
    @EnvironmentObject var workoutModel: WorkoutModel
    
    var body: some View {
        VStack {
            Spacer()
            
            // Start workout button
            Button {
                workoutModel.StartWorkout()
            } label: {
                Text("Start Workout")
                    .frame(width: 300.0, height: 300)
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .clipShape(Circle())
            }
            
            Spacer()
        }
    }
}

struct StartWorkoutButton_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkoutButton()
            .environmentObject(WorkoutModel())
    }
}
