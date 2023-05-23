//
//  CurrentExerciseSet.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/13/23.
//

import SwiftUI

struct CurrentExerciseSet: View {
    
    var reps : Int
    var weight: Int
    
    var body: some View {
        ZStack{

            Rectangle()
                .cornerRadius(25)
                .frame(width: 150, height: 45)
                .layoutPriority(1)
            
            Text("\(reps) X \(weight) lbs")
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct CurrentExerciseSet_Previews: PreviewProvider {
    static var previews: some View {
        CurrentExerciseSet(reps: 12, weight: 150)
    }
}
