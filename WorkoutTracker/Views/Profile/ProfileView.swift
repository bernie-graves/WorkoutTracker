//
//  ProfileView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Page")
            Spacer()
            Text("Name, some personal info")
            
            Spacer()
            Text("Workout stats -- total workouts completed, total weight lifted, total sets/reps.. Some cool graphics or something")
            Spacer()
            Text("List of workouts completed")
            
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
