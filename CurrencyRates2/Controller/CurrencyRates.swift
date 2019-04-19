//
//  ViewController.swift
//  CurrencyRates
//
//  Created by Khaled Bohout on 3/18/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import Alamofire

class CurrencyRates: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var currencies = [Currency]()
    @IBOutlet weak var tableview: UITableView!
    
    typealias downloadcomplete = () -> ()
    
    let downloadUrl = "https://api.exchangeratesapi.io/latest?base=USD"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        downloadcurrencydata {
            print("khaled:download completed")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CurrencyCell {
            let currency = currencies[indexPath.row]
            cell.configurecell(currency: currency)
            return cell
        }
        return CurrencyCell()
    }
    
    func downloadcurrencydata(completed: @escaping downloadcomplete){
        
        AF.request(downloadUrl, method: .get).responseJSON{ response in
            let result = response.result
      
            if let dict = result.value as? Dictionary<String,AnyObject>{
                
                if let currencydict = dict["rates"] as? Dictionary<String,Double> {
                    for obj in currencydict {
                        let currency = Currency(currencykey: obj.key, currencyval: obj.value)
                        self.currencies.append(currency)
                        
                    }
                    self.currencies.remove(at: 0)
                    self.tableview.reloadData()
                }
            }
            completed()
        }
    }
    
    
}


