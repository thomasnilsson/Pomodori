import UIKit

class DateCell: UITableViewCell {
    
    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var entryPomodori: UILabel!
    
    func setData(date: String, pomodori: String) {
        entryDate.text = date
        entryPomodori.text = pomodori
    }
}
