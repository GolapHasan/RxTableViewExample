//
//  CountryCell.swift
//  RxTableViewExample
//
//  Created by Md. Kamrul Hasan on 5/23/18.
//  Copyright © 2018 Md. Kamrul Hasan. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
