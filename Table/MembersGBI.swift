import SwiftUI

class MembersGBI: ObservableObject {
    @Published var members = [Member]()
    
    func isFavourite(stock:Stock) -> Bool {
        return members.contains(where: {$0.isHolding(stock: stock)})
    }
    
    func addMember(member:Member){
        members.append(member)
    }
    
    init(members: [Member]) {
        self.members = members
    }
}
