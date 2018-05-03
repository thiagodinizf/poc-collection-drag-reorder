//
//  ItemCollectionViewCell.swift
//  poc-collection-drag-reorder
//
//  Created by Thiago Diniz on 03/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import Kingfisher

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var channel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
    }
    
    func url(_ string: String) {
        let processor = ResizingImageProcessor(referenceSize: channel.frame.size, mode: .aspectFill)
        channel.kf.setImage(with: URL(string: string)!, options: [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(0.3))])
        
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected {
                UIView.animate(withDuration: 0.15) {
                    self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                    self.backgroundColor = UIColor.orange
                }
            }
            else {
                UIView.animate(withDuration: 0.15) {
                    self.transform = CGAffineTransform.identity
                    self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
                }
            }
        }
    }
}
