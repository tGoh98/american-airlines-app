//
//  GetBuff.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import SwiftUI

struct GetBuff: View {
    @State var buffIndex: Int = 0
    @State var selectedExercise: Int = 0
    // 0 is home
    // 1 is desc
    // 2 is select
    // 3 is working out
    // 4 is congrats
    
    var body: some View {
        switch (buffIndex) {
        case 0:
            PlaneExercises(buffIndex: $buffIndex)
        case 1:
            ExerciseDesc(buffIndex: $buffIndex)
        case 2:
            SelectWorkout(buffIndex: $buffIndex, selectedExercise: $selectedExercise)
        case 3:
            WorkingOut(buffIndex: $buffIndex, eCard: createExerciseCard(index: selectedExercise))
        default:
            Text("unrecognized")
        }
        
        
    }
}

struct GetBuff_Previews: PreviewProvider {
    static var previews: some View {
        GetBuff()
    }
}

func createExerciseCard(index: Int) -> ExerciseCard {
    switch index {
    case 1:
        return ExerciseCard(title: "Toe Lifts", imgSrc: "workout1", desc: "Start with both feet flat on the floor. Lift toes off the floor as far as you can and hold, then let them fall again. Next, lift heels off the floor to tighten leg muscles, repeat 10 times.")
    case 2:
        return ExerciseCard(title: "Ankle Rotation", imgSrc: "workout2", desc: "Lift feet off the floor. Make circles with your toes, with one foot going clockwise and the other counter. Reverse circles. Rotate in each direction for 15 sec then change direction and repeat as desired.")
    case 3:
        return ExerciseCard(title: "Knee Bends", imgSrc: "workout3", desc: "Bend forward slightly, grasp your left knee and pull it in towards your chest, hold for 15–20 seconds, then release and switch knees. Best repeated 10 times.")
    case 4:
        return ExerciseCard(title: "Arm Rotation", imgSrc: "workout4", desc: "Lower your shoulders and rotate your shoulders backwards in circles. Then rotate your shoulders forwards in circles. Repeat each direction 10 times.")
    case 5:
        return ExerciseCard(title: "Arm Stretches", imgSrc: "workout5", desc: "Raise your right arm above your head and bend your elbow. Grasp your elbow with your left hand and pull it in towards your left shoulder. Hold for 15–20 seconds, release gently and repeat with other arm.")
    case 6:
        return ExerciseCard(title: "Spine Rotation", imgSrc: "workout6", desc: "Place your left ankle on your right knee, grasp your right knee with your left arm. Rotate your body by using your arm to pull yourself around, as if looking behind you. Repeat in opposite direction.")
    case 7:
        return ExerciseCard(title: "Lateral Spine Bend", imgSrc: "workout7", desc: "Stand with legs hip width apart, hands by your sides. Pretend you are holding a heavy weight in your left hand and bend sideways on the left, as far as you can. Straighten up and repeat on right side.")
    case 8:
        return ExerciseCard(title: "Chest Stretch", imgSrc: "workout8", desc: "Stand with your legs hip width apart, lower your shoulders and clasp your hands behind your back, then push your arms down while keeping your back stable. Hold for 15–20 seconds, relax and repeat.")
    case 9:
        return ExerciseCard(title: "Aisle Squats", imgSrc: "workout9", desc: "Stand straight with your feet spread shoulder width apart. Lower your body, while pushing your hips back and bending your knees. Slowly lift yourself back up to the starting position.")
    default:
        return ExerciseCard(title: "Lateral Spine Bend", imgSrc: "workout7", desc: "Stand with legs hip width apart, hands by your sides. Pretend you are holding a heavy weight in your left hand and bend sideways on the left, as far as you can. Straighten up and repeat on right side.")
    }
}
