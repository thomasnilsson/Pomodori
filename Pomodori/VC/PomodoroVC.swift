import Foundation
import UIKit

class PomodoroVC: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pomodoriLabel: UILabel!
    @IBOutlet weak var pomodoroButton: UIButton!
    
    let red = UIColor(red: 186/255, green: 31/255, blue: 3/255, alpha: 1)
    let green = UIColor(red: 3/255, green: 150/255, blue: 89/255, alpha: 1)
    let rose = UIColor(red: 173/255, green: 146/255, blue: 192/255, alpha: 1)
    
    var running = false
    var timer: Timer?
    
    let pomodoroTimeSeconds = 25 * 60 // 25 minutes
    let pauseTimeSeconds = 3 * 60 // 3 minutes
    var pomodorosCompleted = 0
    let pomodoriMessage = "Pomodori completed: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = rose
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        running = !running
        
        // Hide "Back Button" from navigation bar if running
        navigationItem.setHidesBackButton(running, animated: true)
        
        if running {
            startTimer()
        }
        else {
            stopTimer()
            view.backgroundColor = rose
            timerLabel.text = "00:00"
        }
    }
    
    // Freeze the timer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startPauseTimer() {
        view.backgroundColor = green
        var timerSeconds = pauseTimeSeconds
        setTimerLabel(seconds: timerSeconds)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timerSeconds -= 1
            self.setTimerLabel(seconds: timerSeconds)
            if timerSeconds < 1 {
                self.stopTimer()
                self.startTimer()
            }
        }
    }
    
    // From https://github.com/zach-snell/Swift3_Stopwatch_Tutorial/
    // Starts and runs the visual stopwatch timer
    func startTimer() {
        view.backgroundColor = red
        var timerSeconds = pomodoroTimeSeconds
        
        setTimerLabel(seconds: timerSeconds)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timerSeconds -= 1
            self.setTimerLabel(seconds: timerSeconds)
            if timerSeconds < 1 {
                self.pomodorosCompleted += 1
                self.pomodoriLabel.text = self.pomodoriMessage + "\(self.pomodorosCompleted)"
                self.stopTimer()
                self.startPauseTimer()
            }
        }
    }
    
    // Set the timer hours/minutes/seconds.
    func setTimerLabel(seconds: Int) {
        // Convert from Seconds
        let minutesPortion = String(format: "%02d", (seconds / 60) % 60)
        let secondsPortion = String(format: "%02d", seconds % 60 )
        timerLabel.text = "\(minutesPortion):\(secondsPortion)"
    }
    
}
