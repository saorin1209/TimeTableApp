

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        classLabel.numberOfLines = 0
        roomLabel.numberOfLines = 0
        
    }
}
