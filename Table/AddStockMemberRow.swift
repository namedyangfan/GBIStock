//
//  AddStockMemberView.swift
//  Table
//
//  Created by Fan Yang on 2020-03-26.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct AddStockMemberRow: View {
    var isOn: Bool
    var stock: Stock
    var addStock: () -> ()
    
    var body: some View {
        HStack{
            Text(self.stock.name)
            Spacer()
            if (isOn){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
            }

        }                .onTapGesture {
            self.addStock()
        }
    }
}

struct AddStockMemberRow_Previews: PreviewProvider {
    static var previews: some View {
        AddStockMemberRow(isOn:true, stock:TestData.stock1, addStock: {})
    }
}
