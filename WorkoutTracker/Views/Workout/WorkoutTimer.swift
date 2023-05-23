//
//  WorkoutTimer.swift
//  WorkoutTracker
//
//  Created by Bernie Graves on 5/4/23.
//

import SwiftUI

struct WorkoutTimer: View {
    
    @EnvironmentObject var workoutModel: WorkoutModel
    var body: some View {
        VStack {
            
            HStack(spacing: 10) {
                StopwatchUnit(timeUnit: workoutModel.hours, timeUnitText: "HR", color: Color("Secondary"))
                Text(":")
                    .font(.system(size: 48))
                    .offset(y: -18)
                    .foregroundColor(.white)
                StopwatchUnit(timeUnit: workoutModel.minutes, timeUnitText: "MIN", color: Color("Main"))
                Text(":")
                    .font(.system(size: 48))
                    .offset(y: -18)
                    .foregroundColor(.white)
                StopwatchUnit(timeUnit: workoutModel.seconds, timeUnitText: "SEC", color: Color("Highlight"))
            }

            if (workoutModel.hasStartedWorkout) {
                HStack {
                    // Button to pause workout
                    Button {
                        if (workoutModel.isWorkingOut) {
                            workoutModel.PauseWorkout()
                        } else {
                            workoutModel.ResumeWorkout()
                        }

                    } label: {
                        Text(workoutModel.isWorkingOut ? "Pause": "Resume")                 .frame(width: 150.0, height: 60.0)
                            .background(.thinMaterial)
                            .foregroundColor(.black)
                            .cornerRadius(25)
                    }


                    // Button to end workout
                    Button {
                        workoutModel.StopWorkout()
                    } label: {
                        Text("End Workout")
                            .frame(width: 150.0, height: 60.0)
                            .background(Color("Highlight"))
                            .foregroundColor(.black)
                            .cornerRadius(25)

                    }

                }
            } else {
                // Start workout button
                Button {
                    workoutModel.StartWorkout()
                } label: {
                    Text("Start Workout")
                        .frame(width: 300.0, height: 60.0)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .bold()
                }

            }
        }
    }
}

struct StopwatchUnit: View {

    var timeUnit: Int
    var timeUnitText: String
    var color: Color

    /// Time unit expressed as String.
    /// - Includes "0" as prefix if this is less than 10.
    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .fill(color)
                    .frame(width: 75, height: 75, alignment: .center)

                HStack(spacing: 2) {
                    Text(timeUnitStr.substring(index: 0))
                        .font(.system(size: 48))
                        .frame(width: 28)
                        .foregroundColor(.white)
                    Text(timeUnitStr.substring(index: 1))
                        .font(.system(size: 48))
                        .frame(width: 28)
                        .foregroundColor(.white)
                }
            }

            Text(timeUnitText)
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
    }
}

// Extension to String to Put a little space between 2 numbers in stop watch
extension String {
    func substring(index: Int) -> String {
        let arrayString = Array(self)
        return String(arrayString[index])
    }
}

struct WorkoutTimer_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTimer()
            .environmentObject(WorkoutModel())
    }
}
