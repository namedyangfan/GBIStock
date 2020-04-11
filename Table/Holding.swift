//
//  Holding.swift
//  Table
//
//  Created by Fan Yang on 2020-03-31.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

struct Holding: Hashable {
    let stock: Stock
    let numShare: Float
    let purchasePrice: Float
    let value: Float
    
    init(stock:Stock, numShare:Float, purchasePrice:Float) {
        self.stock = stock
        self.numShare = numShare
        self.purchasePrice = purchasePrice
        self.value = numShare * purchasePrice
    }
    
    func dailyGain () -> Float{
        return (stock.price - purchasePrice)/purchasePrice * 100
    }
}
