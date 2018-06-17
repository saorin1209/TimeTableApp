
//前期


import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    static var cellNumber: Int = 0
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var testArray: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        let mondayLabel = makeLabel(x: 38, text: "月")
        self.view.addSubview(mondayLabel)
        
        let tuesdayLabel = makeLabel(x: 97, text: "火")
        self.view.addSubview(tuesdayLabel)
        
        let wendnesLabel = makeLabel(x: 158, text: "水")
        self.view.addSubview(wendnesLabel)
        
        let thursdayLabel = makeLabel(x: 219, text: "木")
        self.view.addSubview(thursdayLabel)
        
        let fridayLabel = makeLabel(x: 278, text: "金")
        self.view.addSubview(fridayLabel)
        
        let saturdayLabel = makeLabel(x: 340, text: "土")
        self.view.addSubview(saturdayLabel)
        
        let label1 = makeNumLabel(y: 135, text: "1")
        self.view.addSubview(label1)
        
        let label2 = makeNumLabel(y: 221, text: "2")
        self.view.addSubview(label2)
        
        let label3 = makeNumLabel(y: 307, text: "3")
        self.view.addSubview(label3)
        
        let label4 = makeNumLabel(y: 393, text: "4")
        self.view.addSubview(label4)
        
        let label5 = makeNumLabel(y: 479, text: "5")
        self.view.addSubview(label5)
        
        let label6 = makeNumLabel(y: 568, text: "6")
        self.view.addSubview(label6)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
//        取得
        if let data = UserDefaults.standard.object(forKey: "TimeTable") as? Data, let array = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Class] {
            ViewController.testArray = array
            print("array:\(array)")
        } else {
            print("Error")
        }
        print("testArray:\(ViewController.testArray)")
        collectionView.reloadData()
    }
    
    
//    セルが選択された時
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        ViewController.cellNumber = indexPath.row
        
        if ViewController.cellNumber == indexPath.row {
            print("セル番号:\(indexPath.row)")
        }
        
        performSegue(withIdentifier: "Modal1", sender: self)
    }
  
    
//    セルの内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.groupTableViewBackground
        
        if let data = ViewController.testArray.first(where: { $0.cellNumber == indexPath.row }) {
            cell.classLabel.text = data.className
            cell.roomLabel.text = data.roomName
        } else {
            cell.classLabel.text = ""
            cell.roomLabel.text = ""
        }
        return cell
    }
    
//    セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
//    セル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      return 36
    }
    
//    セルのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: collectionView.frame.width / 6 - 1, height: collectionView.frame.height / 6 - 1)
        
        return cellSize
    }
    //    余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    //    行の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    //    列の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
//    曜日ラベル
    func makeLabel(x: CGFloat,text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: 78, width: 18, height: 21))
        label.text = text
        
        return label
    }
//    数字ラベル
    func makeNumLabel(y: CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 2, y: y, width: 20, height: 27))
        label.text = text
        
        return label
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
