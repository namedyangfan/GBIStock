//
//  AddStockMemberView.swift
//  Table
//
//  Created by Fan Yang on 2020-03-26.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct AddStockMemberRow: View {
    @EnvironmentObject var membersGBI: MembersGBI
    @State private var modalToggle: Bool = false
    
    var isOn: Bool
    var stock: Stock
    
    var body: some View {
        HStack{
            Text(self.stock.name)
            Spacer()
            if (isOn){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
                .onTapGesture {
                    self.modalToggle.toggle()
                }

            }

        }
        .sheet(isPresented: $modalToggle) {
            AddStockModal(modalToggle: self.$modalToggle, stock:self.stock)
            .environmentObject(self.membersGBI)
        }
    }
}

struct AddStockMemberRow_Previews: PreviewProvider {
    static var membersGBI = TestData.membersGBI()
    static var previews: some View {
        AddStockMemberRow(isOn:false, stock:TestData.stock1)
        .environmentObject(membersGBI)
    }
}
