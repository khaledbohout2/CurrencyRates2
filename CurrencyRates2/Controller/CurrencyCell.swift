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
    
    func configurecell(currency:Currency){
        
        self.currencyNamelbl.text = currency.currencykey
        self.currencyValuelbl.text = "\(currency.currencyValue)"
       // self.currencyImageview.image = UIImage(named: currency.currencykey)
      
    }
    

}
