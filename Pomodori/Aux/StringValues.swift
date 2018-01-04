import Foundation

struct StringValues {
    
    let tapToBeginMsg = "Tap timer to begin!"
    let studyMsg = "OK - Now study!"
    let breakMsg = "OK - Take a short break..."
    
    func pomodoriCompletedMsg(x: Int) -> String {
        return "Pomodori Completed: \(x)"
    }
}
