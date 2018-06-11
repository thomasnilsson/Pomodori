import UIKit

class OverviewTVC: UITableViewController {
    
    var dateEntries: [String] = []
    var pomodoriEntries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateEntries = createDateEntries()
        pomodoriEntries = createPomodoriEntries()
        
        UISetter().setBackground(vc: self)
        self.tableView.rowHeight = 45
    }
    
    func createDateEntries() -> [String] {
        var dates: [String] = []
        
        for i in 1...30 {
            let day = String(format: "%02d", i)
            dates.append("2017-01-\(day)")
        }
        return dates
    }

    func createPomodoriEntries() -> [String] {
        var pomorodi: [String] = []
        
        for _ in 1...30 {
            let random = Int(arc4random_uniform(12) + 1)
            pomorodi.append("\(random)")
        }
        
        return pomorodi
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateEntry = dateEntries[indexPath.row]
        let pomodoriEntry = pomodoriEntries[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell") as! DateCell
        
        cell.setData(date: dateEntry, pomodori: pomodoriEntry)
    
        return cell
    }
}

