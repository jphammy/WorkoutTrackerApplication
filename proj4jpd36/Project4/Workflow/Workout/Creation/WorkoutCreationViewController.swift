import UIKit

protocol WorkoutCreationViewControllerDelegate: class {
    func save(workout: Workout)
}

class WorkoutCreationViewController: UIViewController {
    
    weak var delegate: WorkoutCreationViewControllerDelegate?
    
    @IBOutlet private weak var addWorkoutButton: UIButton!
    @IBOutlet private weak var caloriesLabel: UILabel!
    @IBOutlet private weak var caloriesStepper: UIStepper!
    @IBOutlet private weak var dateField: UITextField!
    @IBOutlet private weak var minutesLabel: UILabel!
    @IBOutlet private weak var minutesStepper: UIStepper!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet fileprivate weak var tapBackGroundView: UIView!
    
    private var datePicker: UIDatePicker!
    private var model: WorkoutCreationModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure date picker
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.date = Date()
        datePicker.addTarget(self, action: #selector(dateValueChanged), for: .valueChanged)
        
        // Configure date text field
        dateField.inputView = datePicker
        dateField.text = datePicker.date.toString(format: .yearMonthDay)
        
        // Configure minutes stepper and label
        minutesStepper.minimumValue = 2
        minutesStepper.maximumValue = 90
        minutesStepper.value = 10
        minutesLabel.text = "\(Int(minutesStepper.value))"
        
        // Calories per minute
        caloriesStepper.minimumValue = 1
        caloriesStepper.maximumValue = 90
        caloriesStepper.value = 5
        caloriesLabel.text = "\(Int(caloriesStepper.value))"
        
        // Configure tappable background when keyboard or picker is displayed
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        tapBackGroundView.addGestureRecognizer(tapGestureRecognizer)
        tapBackGroundView.isHidden = true
        
        // Configure delegates
        nameField.delegate = self
        dateField.delegate = self
    }
    
    @IBAction private func addWorkoutButtonTapped(_ sender: UIButton) {
        var name = nameField.text ?? ""
        if name == "" { name = "No Name" }
        
        let duration = Int(minutesStepper.value)
        let date = datePicker.date
        let caloriesPerMin = Int(caloriesStepper.value)
        
        let workout = Workout(id: UUID(), name: name, date: date, duration: duration, caloriesPerMin: caloriesPerMin)
        
        delegate?.save(workout: workout)
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func calValChanged(_ sender: UIStepper) {
        caloriesLabel.text = "\(Int(sender.value))"
        
    }

    
    @IBAction private func minutesValueChanged(_ sender: UIStepper) {
        minutesLabel.text = "\(Int(sender.value))"
    }
    
    
    @objc private func backgroundTapped() {
        self.view.endEditing(true)
        tapBackGroundView.isHidden = true
    }
    
    @objc private func dateValueChanged() {
        dateField.text = datePicker.date.toString(format: .yearMonthDay)
    }
}

extension WorkoutCreationViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        tapBackGroundView.isHidden = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        tapBackGroundView.isHidden = true
        return true
    }
}
