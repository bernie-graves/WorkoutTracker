//
//  WorkoutTrackerApp.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

@main
struct WorkoutTrackerApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    @StateObject var workoutModel = WorkoutModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                // authentication stuff
                ContentView()
            }
            .environmentObject(viewRouter)
            .environmentObject(workoutModel)
        }
    }
}
