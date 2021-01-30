//
//  ModelData.swift
//  american-airlines-app
//
//  Created by Timothy Goh on 1/30/21.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var intake: Intake = Intake(curIntake: 0, neededIntake: 10)
}
