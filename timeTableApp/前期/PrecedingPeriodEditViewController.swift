
//前期　編集画面

import UIKit

class PrecedingPeriodEditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var roomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classTextField.delegate = self
        roomTextField.delegate = self
        
        // キーボードを閉じる
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapGesture() {
        classTextField.resignFirstResponder()
        roomTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        classTextField.resignFirstResponder()
        roomTextField.resignFirstResponder()
        return true
    }
    
    // 完了ボタンを押した時
    @IBAction func tappedButton(_ sender: UIButton) {
        
        let classData = Class(className:classTextField.text!, roomName: roomTextField.text!, cellNumber: PrecedingPeriodViewController.cellNumber)
        PrecedingPeriodViewController.precedingPeriodClassArray.insert(classData, at: 0)
        
        // 保存
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: PrecedingPeriodViewController.precedingPeriodClassArray), forKey: "PrecedingPeriodTimeTable")
        UserDefaults.standard.synchronize()
        
        dismiss(animated: true) {}
    }
}
