//
//  TableViewCell.swift
//  WeatherInfo
//
//  Created by Sarah Guindy on 2021-04-08.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblMissionName : UILabel!
    @IBOutlet var tvStatusDetails : UITextView!
    @IBOutlet var tvFailureReason : UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
