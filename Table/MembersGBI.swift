import SwiftUI

class MembersGBI: ObservableObject {
    @Published var members = [Member]()
    
    func isFavourite(stock:Stock) -> Bool {
        for member in members{
            if (member.stocks.contains(stock)){
                return true
            }
        }
        return false
    }
    
    func addMember(member:Member){
        members.append(member)
    }
    
    init(members: [Member]) {
        self.members = members
    }
}
