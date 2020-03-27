//
//  AddStockMemberView.swift
//  Table
//
//  Created by Fan Yang on 2020-03-26.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct AddStockMemberView: View {
    @State private var searchString: String = ""
    @State private var searchStocks = [Stock]()
    @EnvironmentObject var membersGBI: MembersGBI
    
    
    var body: some View {
        VStack{
            SearchBar(text: $searchString, searchStocks: $searchStocks)
            List{
                ForEach(self.searchStocks, id: \.self){ stock in
                    AddStockMemberRow(isOn: self.membersGBI.isFavourite(stock: stock), stock: stock, addStock: { self.membersGBI.members[0].addStock(stock: stock)})
                }
            }
        }
    }
}

struct AddStockMemberView_Previews: PreviewProvider {
    static let membersGBI = TestData.membersGBI()
    static var previews: some View {
        AddStockMemberView()
        .environmentObject(membersGBI)
    }
}
