//
//  StockView.swift
//  Table
//
//  Created by Fan Yang on 2020-03-02.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct StockView: View {
    @EnvironmentObject var myStock: MyStock
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(myStock.currentHoldings, id:\.self){ stock in
                        StockViewRow(stock: stock)
                    }
                }
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: SearchStockView()){
                    Text("Add")
                        .font(.system(size: 22))
                }
            )
            .navigationBarTitle("My Stocks")
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static let myStock = MyStock()
    static var previews: some View {
        StockView().environmentObject(myStock)
    }
}
