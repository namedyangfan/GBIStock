
import SwiftUI
/// User
/// Implement Identifiable which will help to uniquely identify each user.
struct Stock: Hashable, Decodable{    
    
    let name: String
    
    let symbol: String
    
    let price: Float
    
    
    /// Init
    init(name: String, symbol: String, price:Float) {
        self.name = name
        self.symbol = symbol
        self.price = price
    }
}
