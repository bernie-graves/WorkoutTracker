//
//  Home.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

struct Home: View {
    
    @Binding var selection: Int
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [Color("MainDark"), Color("Main")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                StartWorkoutHome(selection: _selection)
                
                Spacer()
                Text("Button to Start a workout")
                Spacer()
                Text("Last Weeks workouts -- or just some way to see your last few workout --> can see if youre on push, pull, legs, etc")
                Spacer()
                Text("Motivational Quote or something idk get creative.")
                
                Spacer()

            }
        }
        

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(
            selection: .constant(1)
        )
    }
}
