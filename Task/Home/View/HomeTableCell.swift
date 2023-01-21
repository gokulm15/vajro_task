//
//  HomeTableCell.swift
//  Task
//
//  Created by Apple on 20/01/2023.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.shadowView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIView{
    func shadowView(){
        self.layer.cornerRadius = 7
        self.layer.shadowColor = UIColor.systemGray3.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.7
    }
}
