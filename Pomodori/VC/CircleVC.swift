import UIKit

class CircleVC: UIViewController {
    
    @IBOutlet weak var roundView: MFRoundProgressView!
    @IBOutlet weak var timerButton: UIButton!
    
    var value = 0
    
    let red = UIColor(red: 186/255, green: 31/255, blue: 3/255, alpha: 1)
    let green = UIColor(red: 3/255, green: 150/255, blue: 89/255, alpha: 1)
    let rose = UIColor(red: 173/255, green: 146/255, blue: 192/255, alpha: 1)
    
    var running = false
    var timer: Timer?
    
    let pomodoroTimeSeconds = 60 // 25 minutes
    let pauseTimeSeconds = 10 // 3 minutes
    var pomodorosCompleted = 0
    let pomodoriMessage = "Pomodori completed: "

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = rose
    }

    @IBAction func buttonTapped(_ sender: Any) {
        running = !running
        
        // Hide "Back Button" from navigation bar if running
        navigationItem.setHidesBackButton(running, animated: true)
        
        if running {
            startTimer()
        }
        else {
            stopTimer()
            view.backgroundColor = rose
            timerButton.setTitle("00:00", for: .normal)
            roundView.percent = CGFloat(0.0)
        }
    }
    
    // Freeze the timer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startPauseTimer() {
        view.backgroundColor = green
        var timeLeft = pauseTimeSeconds
        setTimerLabel(seconds: timeLeft)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeLeft -= 1
            self.updateProgressBar(secondsLeft: timeLeft, timer: "pause")
            self.setTimerLabel(seconds: timeLeft)
            if timeLeft < 1 {
                self.stopTimer()
                self.startTimer()
            }
        }
    }
    
    // From https://github.com/zach-snell/Swift3_Stopwatch_Tutorial/
    // Starts and runs the visual stopwatch timer
    func startTimer() {
        var timeLeft = pomodoroTimeSeconds
        view.backgroundColor = red
        setTimerLabel(seconds: timeLeft)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeLeft -= 1
            self.updateProgressBar(secondsLeft: timeLeft, timer: "pomodoro")
            self.setTimerLabel(seconds: timeLeft)
            if timeLeft < 1 {
                self.pomodorosCompleted += 1
                self.stopTimer()
                self.startPauseTimer()
            }
        }
    }
    
    func updateProgressBar(secondsLeft: Int, timer: String) {
        let total = timer == "pomodoro" ? Double(pomodoroTimeSeconds) : Double(pauseTimeSeconds)
        let timeLeft = Double(secondsLeft)
        let progress = 100.0 * (total - timeLeft) / total
        roundView.percent = CGFloat(progress)
    }
    
    // Set the timer hours/minutes/seconds.
    func setTimerLabel(seconds: Int) {
        // Convert from Seconds
        let minutesPortion = String(format: "%02d", (seconds / 60) % 60)
        let secondsPortion = String(format: "%02d", seconds % 60 )
        let time = "\(minutesPortion):\(secondsPortion)"
        timerButton.setTitle(time, for: .normal)
    }
    
}
