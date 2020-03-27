//
//  StcokViewRow.swift
//  Table
//
//  Created by Fan Yang on 2020-03-03.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct StockViewRow: View {
    var stock: Stock
    
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
            Text(stock.symbol)
              .font(.system(size:20))
              Text(stock.name)
                .font(.system(size:14))
            }
   
            Spacer()
            Text(String(stock.price))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct StockViewRow_Previews: PreviewProvider {
    static var previews: some View {
        StockViewRow(stock: TestData.manulife)
    }
}
