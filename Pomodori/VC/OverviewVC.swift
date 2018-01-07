import UIKit

class OverviewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dateEntries: [String] = []
    var pomodoriEntries: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateEntries = createDateEntries()
        pomodoriEntries = createPomodoriEntries()
    }
    
    func createDateEntries() -> [String] {
        let x = ["01/02-2017", "02/02-2017", "03/02-2017", "04/02-2017"]
        return x
    }
    
    func createPomodoriEntries() -> [String] {
        let x = ["3", "5", "1", "2"]
        return x
    }
}

extension OverviewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateEntry = dateEntries[indexPath.row]
        let pomodoriEntry = pomodoriEntries[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell") as! DateCell
        
        cell.setData(date: dateEntry, pomodori: pomodoriEntry)
        
        return cell
    }
}
