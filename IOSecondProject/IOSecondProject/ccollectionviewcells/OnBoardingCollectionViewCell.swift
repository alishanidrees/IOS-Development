//
//  OnBoardingCollectionViewCell.swift
//  IOSecondProject
//
//  Created by Ali Shan on 10/11/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var onboardingUIImage: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    
    static let identifier = "OnBoardingCollectionViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureDataCell(page:Page){
        self.onboardingUIImage.image = page.onboardingImage
        self.lblName.text = page.title
        self.lblDesc.text = page.description
    }

}
