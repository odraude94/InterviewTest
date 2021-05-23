//
//  CountryDetailVC.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 16/05/21.
//

import UIKit
import SnapKit
import SVGKit

class CountryDetailVC: UIViewController {
    
    //MARK: Properties
    var country: Country?
    let imvFlag = UIImageView()
    let lblName = UILabel()
    let lblCapital = UILabel()
    let btnCancel = UIButton()
    
    //MARK: life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setData()
    }
    
    //MARK: UI
    func setupUI(){
        
        let vBackground = UIView()
        view.addSubview(vBackground)
        vBackground.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        vBackground.frame = view.frame
        
        let vBox = UIView()
        vBox.cornerRadius(16)
        vBox.backgroundColor = .white
        vBackground.addSubview(vBox)
        vBox.snp.makeConstraints { (make)->Void in
            make.centerY.equalTo(view)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.height.greaterThanOrEqualTo(50)
        }
        
        vBox.addSubview(imvFlag)
        imvFlag.contentMode = .scaleAspectFit
        imvFlag.snp.makeConstraints { (make)->Void in
            make.top.equalTo(vBox).offset(20)
            make.centerX.equalTo(vBox)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        vBox.addSubview(lblName)
        lblName.textAlignment = .center
        lblName.numberOfLines = 0
        lblName.font = .of(.koHoBold, 18)
        lblName.snp.makeConstraints { (make)->Void in
            make.top.equalTo(imvFlag.snp.bottom).offset(8)
            make.leading.equalTo(vBox).offset(8)
            make.trailing.equalTo(vBox).offset(-8)
        }
        
        vBox.addSubview(lblCapital)
        lblCapital.textAlignment = .center
        lblCapital.font = .of(.koHoRegular, 16)
        lblCapital.snp.makeConstraints { (make)->Void in
            make.top.equalTo(lblName.snp.bottom).offset(8)
            make.leading.equalTo(vBox).offset(8)
            make.trailing.equalTo(vBox).offset(-8)
        }
        
        vBox.addSubview(btnCancel)
        btnCancel.setTitle("OK", for: .normal)
        btnCancel.setTitleColor(.systemBlue, for: .normal)
        btnCancel.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnCancel.snp.makeConstraints { (make)->Void in
            make.top.equalTo(lblCapital.snp.bottom).offset(8)
            make.centerX.equalTo(vBox)
            make.height.equalTo(33)
            make.width.equalTo(120)
            make.bottom.equalTo(vBox).offset(-8)
        }
    }
    
    //MARK: Functions
    func setData(){
        lblName.text = country?.name
        lblCapital.text = country?.capital
        
        if let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: country?.flag ?? "")){
            imvFlag.image =  mySVGImage.uiImage
        }
    }
    
    //MARK: Objc functions
   @objc func close(){
        self.dismiss(animated: true, completion: nil)
    }

}
