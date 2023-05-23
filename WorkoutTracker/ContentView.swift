//
//  ContentView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
            
            
            switch viewRouter.currentPage {
            case .signUpPage:
                SignUpView()
            case .signInPage:
                SignInView()
            case .homePage:
                MainView()
            case .workoutPage:
                WorkoutView()
            }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())
    }
}
