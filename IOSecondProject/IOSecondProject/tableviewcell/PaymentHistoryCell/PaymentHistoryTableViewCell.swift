//
//  PaymentHistoryTableViewCell.swift
//  IOSecondProject
//
//  Created by Ali Shan on 14/11/2023.
//

import UIKit
import SDWebImage


class PaymentHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgviewProfile: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    
    static let nib = UINib(nibName: "PaymentHistoryTableViewCell", bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        imgviewProfile.setImageBound()
        viewBackground.setViewBackgroundBorder()
        viewBackground.dropShadow(shadowRadius: 4.0, offsetSize: .init(width: 0, height: 1), shadowOpacity: 0.16, shadowColor: UIColor.black)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configureData(partner:Partner){
        imgviewProfile.sd_setImage(with: URL(string:partner.image ?? ""), placeholderImage: UIImage(named: "ic_profile"))
        lblName.text = partner.name
        lblDate.text =  partner.description
        lblPrice.text = partner.id
    }
    

}

