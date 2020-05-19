//
//  CurrencyCell.swift
//  CurrencyRates
//
//  Created by Khaled Bohout on 3/21/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {


    @IBOutlet weak var currencyNamelbl: UILabel!
    @IBOutlet weak var currencyValuelbl: UILabel!
    
    func configurecell(currency:CurrencyViweModel){
        
        self.currencyNamelbl.text = currency.cur
        self.currencyValuelbl.text = "\(currency.val ?? 0.0)"
       // self.currencyImageview.image = UIImage(named: currency.currencykey)
      
    }
    

}
