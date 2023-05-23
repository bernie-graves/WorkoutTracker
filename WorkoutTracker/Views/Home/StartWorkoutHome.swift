//
//  StartWorkoutHome.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

struct StartWorkoutHome: View {
    
    @Binding var selection: Int
    
    var body: some View {
        Button(action: {
            self.selection = 2
        }) {
            Text("Start Workout")
                .foregroundColor(.black)
                .frame(width: 300.0, height: 60.0)
                .background(Color("Main"))
                .cornerRadius(8)
        }

    }
}

struct StartWorkoutHome_Previews: PreviewProvider {
    
    static var previews: some View {
        StartWorkoutHome(
            selection: .constant(2)
        )
    }
}
