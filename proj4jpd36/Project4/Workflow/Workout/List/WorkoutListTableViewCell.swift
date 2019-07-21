import UIKit

final class WorkoutListTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet weak var totalCaloriesBurned: UILabel!
    
    func decorate(with workout: Workout) {
        nameLabel.text = workout.name
        dateLabel.text = workout.date.toString(format: .yearMonthDay)
        durationLabel.text = "\(workout.duration) minutes"
        totalCaloriesBurned.text = "\(workout.caloriesBurned()) cals burn 🔥"
    }
}
