//
//  CountriesTVCell.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 15/05/21.
//

import UIKit
import SnapKit
import SVGKit

class CountriesTVCell: UITableViewCell {
    
    let imvFlag = UIImageView()
    let lblName = UILabel()
    let lblCapital = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imvFlag)
        imvFlag.contentMode = .scaleAspectFit
        imvFlag.snp.makeConstraints { (make)->Void in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(16)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        contentView.addSubview(lblName)
        lblName.font = .of(.koHoBold, 16)
        lblName.snp.makeConstraints { (make)->Void in
            make.bottom.equalTo(contentView.snp.centerY)
            make.leading.equalTo(imvFlag.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        contentView.addSubview(lblCapital)
        lblCapital.font = .of(.koHoRegular, 16)
        lblCapital.snp.makeConstraints { (make)->Void in
            make.top.equalTo(contentView.snp.centerY)
            make.leading.equalTo(imvFlag.snp.trailing).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(_ country: Country){
        
        lblName.text = country.name
        lblCapital.text = country.capital
        
        if let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: country.flag )){
            imvFlag.image =  mySVGImage.uiImage
        }
    }

}
