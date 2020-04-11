//
//  MemberView.swift
//  
//
//  Created by Fan Yang on 2020-03-25.
//

import SwiftUI

struct MemberSection: View {
    var member: Member
    @State private var showStock: Bool = true
    
    var body: some View {
            VStack (alignment: .leading, spacing: 20) {
                Section(header:
                        Text(member.initials)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .font(.system(size:20, weight: .bold))
                        .cornerRadius(25)
                        .onTapGesture() {
                            self.showStock.toggle()
                        }
                )  {
                    if(self.showStock){
                        ForEach(member.portfolio, id: \.self){ holding in
                            StockViewRow(holding: holding)
                        }
                    }
               }
            
            }
}
}

struct MemberSection_Previews: PreviewProvider {
    static var previews: some View {
        MemberSection(member: TestData.fan)
    }
}
