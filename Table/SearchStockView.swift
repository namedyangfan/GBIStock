//
//  SearchStockView.swift
//  Table
//
//  Created by Fan Yang on 2020-03-04.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct SearchStockView: View {

    @State private var searchTerm: String = ""
    @State private var searchStocks = [Stock]()
    @EnvironmentObject var myStock: MyStock
    let stocks = TestData.allStocks()
    var body: some View {
        VStack{
            SearchBar(text: $searchTerm, searchStocks: $searchStocks)
            List{
                ForEach(self.searchStocks, id: \.self){ stock in
                    HStack{
                        Text(stock.name)
                            .onTapGesture() {
                                self.myStock.add(stock: stock)
                            }
                        Spacer()
                        if (self.myStock.isMyStock(stock: stock)){
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
        }

    }
}

struct SearchStockView_Previews: PreviewProvider {
    static let myStock = MyStock()
    static var previews: some View {
        SearchStockView()
        .environmentObject(myStock)
    }
}
