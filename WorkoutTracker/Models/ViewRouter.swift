//
//  ViewRouter.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/3/23.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .homePage
    
    enum Page {
        case signUpPage
        case signInPage
        case homePage
        case workoutPage
        
    }
}
