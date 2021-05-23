//
//  CountriesVC.swift
//  StellaTest
//
//  Created by Eduardo Martinez on 15/05/21.
//

import UIKit
import SnapKit
import Realm
import RealmSwift

class CountriesVC: UIViewController {
    //MARK: Properties
    lazy var tvCountries: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 70
        tv.register(CountriesTVCell.self, forCellReuseIdentifier: "CountriesTVCell")
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    var countries = [Country]()
    let realm = try! Realm()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        countries =  realm.objects(Country.self).map({$0})
        
        guard countries.count == 0 else {
            tvCountries.reloadData()
            return
        }
        
        getCountries()
    }
    
    //MARK: UI
    func setupUI(){
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(tvCountries)
        tvCountries.snp.makeConstraints { (make)->Void in
            make.size.equalTo(safeArea)
        }
        
        tvCountries.reloadData()
    }
    
    //MARK: Functions
    func getCountries(){
        
        let url = URL(string: Api.ws.get.all)
        
        Server.sharedInstance.request(from: url! , method: .get, decodable: Country.self) { (countries:[Country]) in
            
            do{
                
                let realm = try Realm()
                
                for country in countries {
                    try realm.write {
                        realm.add(country)
                    }
                }
                
                self.countries =  realm.objects(Country.self).map({$0})
                
                //This object break the app
                self.countries.removeAll(where: {$0.name == "Saint Helena, Ascension and Tristan da Cunha"})
                
                self.tvCountries.reloadData()
                
            }catch let error{
                print(error)
            }
        }
    }
}

//MARK: Table delegates
extension CountriesVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTVCell", for: indexPath) as! CountriesTVCell
        let country = countries[indexPath.row]
        cell.config(country)
        
        return cell
    }
}

extension CountriesVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        let vc = CountryDetailVC()
        vc.country = country
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
