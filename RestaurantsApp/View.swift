//
//  View.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/16/21.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class ResturantListView: UIView {
   
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let resturantHeader : UILabel = {
       let label = UILabel()
        label.text = "Restaurants"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 36.0)
        return label
    }()
    let resturantListView :UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        return tableView
    }()
 
    func setUpAutoLayout (){
        contentView.addSubview(resturantListView)
        //contentView.addSubview(resturantHeader)
        contentView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        /*resturantHeader.snp.makeConstraints{ make in
            
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(16)
        }*/
        resturantListView.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(75)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
        
    }
}
