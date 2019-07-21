import Foundation

protocol WorkoutCreationModelDelegate: class {
    func save(workout: Workout)
}

final class WorkoutCreationModel {
    let minimumStepperValue: Double = 0.0
    let maximumStepperValue: Double = 90.0
    
    private(set) var workout: Workout
    
    private weak var delegate: WorkoutCreationModelDelegate?
    
    init(workout: Workout, delegate: WorkoutCreationModelDelegate) {
        self.workout = workout
        self.delegate = delegate
    }
}


