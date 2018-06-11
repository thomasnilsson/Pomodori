import UIKit

class OverviewVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var dateEntries: [String] = []
//    var pomodoriEntries: [String] = []
    var entries = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entries = mockEntriesFactory()
//        dateEntries = createDateEntries()
//        pomodoriEntries = createPomodoriEntries()
        
        
    }
    
    func createDateEntries() -> [String] {
        let x = ["01/02-2017", "02/02-2017", "03/02-2017", "04/02-2017"]
        return x
    }
    
    func createPomodoriEntries() -> [String] {
        let x = ["3", "5", "1", "2"]
        return x
    }
    
    func mockEntriesFactory() -> [String: String] {
        var mockEntries = [String: String]()
        mockEntries["2017-02-01"] = "3"
        mockEntries["2017-03-01"] = "5"
        mockEntries["2017-04-01"] = "7"
        mockEntries["2017-05-01"] = "9"
        mockEntries["2017-06-01"] = "11"
        mockEntries["2017-07-01"] = "13"
        return mockEntries
    }
}

extension OverviewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let dateEntry = dateEntries[indexPath.row]
//        let pomodoriEntry = pomodoriEntries[indexPath.row]
        let dateEntry = Array(entries)[indexPath.row].key
        let pomodoriEntry = Array(entries)[indexPath.row].value
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell") as! DateCell
        
        cell.setData(date: dateEntry, pomodori: pomodoriEntry)
        
        return cell
    }
}
