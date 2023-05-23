//
//  TextExtenstions.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/19/23.
//

import Foundation
import SwiftUI


extension Text {
    
    func smallTextStyle() ->  some View {
        self.foregroundColor(.red)
            .italic()
            .opacity(0.7)
            .font(.subheadline)
    }
}
