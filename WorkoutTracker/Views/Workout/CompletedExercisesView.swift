//
//  CompletedExercisesView.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/17/23.
//

import SwiftUI
import ExytePopupView

struct CompletedExercisesView: View {
        @EnvironmentObject var workoutModel: WorkoutModel
    
        @State var showDetailedExerciseView = false

        var body: some View {
            
            VStack {
                
                HStack{
                    Text("Completed Exercises")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                .padding()
                
                ScrollView {
                    VStack(spacing: 8) {
                        
                        ForEach(workoutModel.currentWorkout.exercises.reversed()) { exercise in
                            exerciseView(exercise: exercise)
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }

    
    func exerciseView(exercise: Exercise) -> some View {
        
        
        
        return HStack {
            VStack {
                Text(exercise.exerciseName)
                    .font(.title2)
                    .bold()

            }
            .padding()
            
            Spacer()

                
            VStack {
                Text("**Sets:** \(exercise.sets.count) X \(formatRepRange(sets:exercise.sets))")
                
                Text("**Duration:** \(formatDuration(exercise.duration))")
                    .foregroundColor(.black)
            }
            .padding(.horizontal)

                

            }
        .frame(height: 75)
        .background(.thinMaterial)
        .cornerRadius(10)
        .padding(2)
        .onTapGesture {
            self.showDetailedExerciseView.toggle()
        }
        .popup(isPresented: $showDetailedExerciseView) {
            detailedExerciseView(exercise: exercise)
        } customize: {
            $0
                .type(.default)
                .closeOnTapOutside(true)
                .position(.bottom)
        }

    }
    
    func detailedExerciseView(exercise: Exercise) -> some View {
        
        VStack{
    
            HStack{
                Text(exercise.exerciseName)
                    .font(.title)
            }
            
            ForEach(exercise.sets, id:\.self) {set in
                
                Text("\(set.reps) X \(Int(set.weight)) lbs")
                
            }
        }
        .frame(width: 300, height: 400)
        .background(.gray)
        .cornerRadius(30)
        
    }

    
    func formatDuration(_ duration: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        if let formattedString = formatter.string(from: TimeInterval(duration)) {
            return formattedString
        } else {
            return ""
        }
    }
    
    func formatRepRange(sets: [SetObject]) -> String {
        
        if let minReps = sets.min(by: { $0.reps < $1.reps }),
           let maxReps = sets.max(by: { $0.reps < $1.reps }) {

            if minReps.reps == maxReps.reps {
                return "\(minReps.reps)"
            } else {
                return "\(minReps.reps)-\(maxReps.reps)"
                
                }
                
        } else {
            
            return ""
        }
    }
}

struct CompletedExercisesView_Preview: PreviewProvider {
    static var previews: some View {
        WorkoutView()
            .environmentObject(WorkoutModel())
    }
}
