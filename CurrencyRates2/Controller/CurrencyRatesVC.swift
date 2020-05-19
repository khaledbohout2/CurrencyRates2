//
//  ViewController.swift
//  CurrencyRates
//
//  Created by Khaled Bohout on 3/18/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import Alamofire

class CurrencyRatesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    var VM = CurrenciesListViweModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        VM.requestRates()
        VM.currencies.bind { _ in
            self.tableview.reloadData()
        }
                
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return VM.currencies.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CurrencyCell {
            let currency = (VM.currencies.value?[indexPath.row])!
            cell.configurecell(currency: currency)
            return cell
        }
        return CurrencyCell()
    }
    
}


