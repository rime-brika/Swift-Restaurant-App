//
//  SearchView.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/24/21.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class SearchView: UIView{
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let header: UILabel = {
        let label = UILabel()
        label.text = "Search for nearby Restaurants based on your zipcode"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.center = .zero
        
        label.adjustsFontForContentSizeCategory =  true
        return label
    }()
    let zipCode: UITextField = {
        let textField = UITextField()
        textField.placeholder = " Enter your Zip Code"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .line
        textField.text = nil
        return textField
    }()
    let submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Search for Resturants", for: .normal)
        btn.backgroundColor = .blue
        btn.tintColor = .white
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    } ()
    func setUpAutoLayout (){
        contentView.addSubview(header)
        contentView.addSubview(zipCode)
        contentView.addSubview(submitButton)
        
        contentView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        header.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(32)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(50)
        }
        zipCode.snp.makeConstraints{ make in
            make.top.equalTo(header.snp.bottom).offset(150)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(submitButton.snp.top).offset(-172)
            make.height.equalTo(50)
            
        }
        submitButton.snp.makeConstraints{ make in
            //make.top.equalTo(zipCode.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            //make.bottom.equalTo(contentView.snp.bottom).offset(-16)
            make.height.equalTo(50)
            
        }
        
    }}
