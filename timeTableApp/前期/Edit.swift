
//前期　編集画面

import UIKit

class Class: NSObject, NSCoding {

    
    let className: String
    let roomName: String
    let cellNumber: Int
    
    init(className: String, roomName: String, cellNumber: Int) {

        self.className = className
        self.roomName = roomName
        self.cellNumber = cellNumber
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.className, forKey: "name")
        aCoder.encode(self.roomName, forKey: "room")
        aCoder.encode(self.cellNumber, forKey: "number")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.className = aDecoder.decodeObject(forKey: "name") as! String
        self.roomName = aDecoder.decodeObject(forKey: "room") as! String
        self.cellNumber = aDecoder.decodeInteger(forKey: "number")
    }
}

class Edit: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var roomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classTextField.delegate = self
        roomTextField.delegate = self
                
//        キーボードを閉じる
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
    
    
//    完了ボタンを押した時
    @IBAction func tappedButton(_ sender: UIButton) {
        
        let classData = Class(className:classTextField.text!, roomName: roomTextField.text!, cellNumber: ViewController.cellNumber)
        ViewController.testArray.insert(classData, at: 0)
        
//        保存
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: ViewController.testArray), forKey: "TimeTable")
        UserDefaults.standard.synchronize()
        
//        print("配列の中身:\(ViewController.testArray)")
        
        dismiss(animated: true) {}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
