//
//  MemberView.swift
//  Table
//
//  Created by Fan Yang on 2020-03-25.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI

struct MemberView: View {
    @EnvironmentObject var membersGBI: MembersGBI
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(membersGBI.members, id: \.self){ member in
                        MemberSection(member: member)
                    }
                }
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: AddStockMemberView()){
                    Text("Add")
                        .font(.system(size: 22))
                        .padding(.all, 8)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            )
            .navigationBarTitle("Team GBI")
        }
    }
}

struct MemberView_Previews: PreviewProvider {
    static let membersGBI = TestData.membersGBI()
    static var previews: some View {
        MemberView()
        .environmentObject(membersGBI)
    }
}
