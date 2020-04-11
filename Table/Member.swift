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
    var portfolio: [Holding]
    let initials: Substring
    
    init(firstName:String, lastName:String, portfolio:[Holding]) {
        self.firstName = firstName
        self.lastName = lastName
        self.initials = firstName.prefix(1) + lastName.prefix(1)
        self.portfolio = portfolio
    }
    
    mutating func addHolding(holding: Holding){
        portfolio.append(holding)
    }
    
    func isHolding (stock: Stock) -> Bool{
        return portfolio.contains(where: {$0.stock == stock})
    }
}
