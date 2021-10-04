//
//  DetailedView.swift
//  RestaurantsApp
//
//  Created by rime.brika on 9/24/21.
//

import Foundation
import UIKit
import SnapKit
import RxSwift

class DetailedView: UIView{
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var detailed1TextView : UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .purple
        return textField
    }()
    
    var detailed2TextView : UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .blue
        return textField
    }()
    
    var detailed3TextView : UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemPink
        return textField
    }()
    func setUpAutoLayout (){
        contentView.addSubview(detailed1TextView)
        contentView.addSubview(detailed2TextView)
        contentView.addSubview(detailed3TextView)
        
        contentView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
        detailed1TextView.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(70)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        detailed2TextView.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(220)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
       
        detailed3TextView.snp.makeConstraints{ make in
            make.top.equalTo(contentView.snp.top).offset(370)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
    }
