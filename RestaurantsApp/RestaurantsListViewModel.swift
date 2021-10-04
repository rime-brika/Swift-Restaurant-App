//
//  RestaurantsListViewModel.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/16/21.
//

import Foundation
import UIKit

class RestaurantTableViewCell: UITableViewCell {

    var restaurantName: UILabel = UILabel()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        //First Call Super
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //Initialize Text Field
        self.restaurantName = UILabel(frame: CGRect(x: 119.00, y: 9, width: 216.00, height: 31.00));

        //Add TextField to SubView
        self.addSubview(self.restaurantName)
    }

    
}
