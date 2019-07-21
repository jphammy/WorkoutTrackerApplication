import UIKit

protocol WorkoutSortByViewControllerDelegate: class {
    func sortByDuration()
    func sortByCaloriesBurned()
    func sortByDate(ascending: Bool)
    func deleteAllWorkouts()
}


class WorkoutSortByViewController: UIViewController {
    weak var delegate: WorkoutSortByViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

    @IBAction func dateAscendButtonPressed(_ sender: Any) {
        delegate?.sortByDate(ascending: true)
        let _ = navigationController?.popViewController(animated: true)
        print("Sort By Date")
    }
    
    @IBAction func dateDescendButton(_ sender: Any) {
        print("Sort By Date Descending")
        delegate?.sortByDate(ascending: false)
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func durationDescendButt(_ sender: Any) {
        print("Sort By Duration Descending")
        delegate?.sortByDuration()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func caloriesBurnedDescend(_ sender: Any) {
        print("Sort By Calories Burned")
        delegate?.sortByCaloriesBurned()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteAl(_ sender: Any) {
        print("Delete")
        delegate?.deleteAllWorkouts()
        let _ = navigationController?.popViewController(animated: true)
    }
    
}
