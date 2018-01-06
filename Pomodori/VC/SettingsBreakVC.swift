import UIKit

class SettingsBreakVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var data = [String]()
    var chosen = "none"
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        UISetter().roundButtonCorners(buttons: [okButton])
        
        for i in 1...10 {
            data.append("\(i)")
        }
    }
    
    @IBAction func okButtonTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        let row = pickerView.selectedRow(inComponent: 0)
        chosen = data[row]
        defaults.set(chosen, forKey: StringValues().breakLengthKey)
        print("Break Time: \(chosen)")
    }
    
    // Boilerplate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Boilerplate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    // Delegate for when wheels stops
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //chosen = data[row]
    }
    
    // Populate PickerView. Change font to white.
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let element = data[row]
        let text = NSAttributedString(string: element, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 20.0)!, NSAttributedStringKey.foregroundColor:UIColor.white])
        return text
    }

}
