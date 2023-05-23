//
//  HomePageView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import SwiftUI

struct MainView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .black
    }
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var selection = 1

    
    var body: some View {
        
        
        
        TabView(selection: $selection) {
            
            // home page
            Home(selection: $selection)
                .tabItem {
                Label("Home", systemImage: "house")
                }
                .tag(1)

            // profile page
            WorkoutView()
                .tabItem {
                    Image("Dumbbell")
                        .renderingMode(.template)
                    Text("Workout")
                }
                .tag(2)
            
            WorkoutGenerator()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("GPT Workout")
                }
                .tag(3)

        }
        .accentColor(Color("Highlight"))
        .navigationTitle("Workout Tracker")
        .toolbarBackground(
            .hidden,
            for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                                NavigationLink {
            // destination
            ProfileView()
            
        } label: {
            Image(systemName: "person.fill")
                .foregroundColor(.black)
        }
            .accentColor(Color("MainDark"))
                            
        )

    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
        }
        .environmentObject(ViewRouter())
        .environmentObject(WorkoutModel())
        }
}
