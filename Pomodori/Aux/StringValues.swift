import Foundation

struct StringValues {
    
    let tapToBeginMsg = "Tap timer to begin!"
    let studyMsg = "OK - Now study!"
    let breakMsg = "OK - Take a short break..."
    
    let lastSessionKey = "LAST_SESSION"
    let lastSessionPomodori = "LAST_SESSION_POMODORI"
    
    let pomodoriLengthKey = "POMODORI_LENGTH"
    let breakLengthKey = "BREAK_LENGTH"
    
    func pomodoriCompletedMsg(x: Int) -> String {
        return "Pomodori Completed: \(x)"
    }
    
    func getDate() -> String {
        let date = Date()
        let calendar = Calendar.current
        let c = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        if let year = c.year, let month = c.month, let day = c.day {
            return "\(year)-\(month)-\(day)"
        }
        // Something bad happened here...
        return "0000-00-00"
    }
    
    func readFromDefaults(key: String) -> String {
        let value = UserDefaults.standard.object(forKey: key) as? String ?? "DEFAULT"
        return value
    }
    
    
}
