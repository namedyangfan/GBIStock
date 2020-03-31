//
//  Member.swift
//  Table
//
//  Created by Fan Yang on 2020-03-25.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

struct Member: Hashable {
    let firstName: String
    let lastName: String
    var stocks: [Stock]
    let initials: Substring
    
    init(firstName:String, lastName:String, stocks:[Stock]) {
        self.firstName = firstName
        self.lastName = lastName
        self.stocks = stocks
        self.initials = firstName.prefix(1) + lastName.prefix(1)
    }
    
    mutating func addStock(stock: Stock){
        self.stocks.append(stock)
    }
}

struct holding: Hashable {
    var stock: Stock
    var numShare: Float
    var purchasePrice: Float
}
