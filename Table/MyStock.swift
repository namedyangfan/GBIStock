//
//  MyStock.swift
//  Table
//
//  Created by Fan Yang on 2020-03-17.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

class MyStock: ObservableObject {
    @Published var currentHoldings = [Stock]()
    
    init(){
        self.currentHoldings = TestData.stcoks()
    }
    
    func add(stock:Stock) -> Void{
        if !currentHoldings.contains(stock) {
           currentHoldings.append(stock)
        }
    }
    
    func isMyStock(stock:Stock) -> Bool{
        if currentHoldings.contains(stock){
            return true
        }
        return false
    }
}
