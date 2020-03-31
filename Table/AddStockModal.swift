//
//  AddStockModal.swift
//  Table
//
//  Created by Fan Yang on 2020-03-27.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI
import LBTATools

struct AddStockModal: View {
    @EnvironmentObject var membersGBI: MembersGBI
    @Binding var modalToggle:Bool
    @State private var selection = 0
    @State private var numShares: String = ""
    @State private var shareUnitPrice = ""
    
    var stock:Stock

    var body: some View {
        NavigationView {
            VStack{
                TextField("Number of shares", text: $numShares)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Share Price", text: $shareUnitPrice)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker(selection: $selection, label: EmptyView())
                    {
                        ForEach(0 ..< self.membersGBI.members.count) { index in
                            Text(self.membersGBI.members[index].firstName).tag(index)
                        }
                    }
                .labelsHidden()
                .offset(x: 0, y: -40)

                
                VStack(spacing:20){
                    Button(action: {
                        self.modalToggle.toggle()
                        self.membersGBI.members[self.selection].addStock(stock:self.stock)
                    }) {
                        HStack {
                            Spacer()
                            Text("Submit")
                            Spacer()
                        }
                    }
                    .font(.system(size: 22))
                    .padding(.all, 10)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
                    
                    Button(action: {
                        self.modalToggle.toggle()
                    }) {
                        HStack() {
                            Spacer()
                            Text("Cancel")
                            Spacer()
                            
                        }
                    }
                    .font(.system(size: 22))
                    .padding(.all, 10)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(8)
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Add \(self.stock.symbol) to \(self.membersGBI.members[self.selection].firstName)'s portfolio", displayMode: .inline)
        }
    }

}

struct AddStockModal_Previews: PreviewProvider {
    static let membersGBI = TestData.membersGBI()
    @State static var modalToggle = true
    static var stock = TestData.MSFT
    
    static var previews: some View {
        AddStockModal(modalToggle: $modalToggle, stock:stock)
        .environmentObject(membersGBI)
    }
}
