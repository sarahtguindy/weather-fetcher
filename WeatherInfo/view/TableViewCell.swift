//
//  TableViewCell.swift
//  WeatherInfo
//
//  Created by Sarah Guindy on 2021-04-08.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblCity : UILabel!
    @IBOutlet var lblTemp : UILabel!
    @IBOutlet var lblFeelsLike : UILabel!
    @IBOutlet var lblWind : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
