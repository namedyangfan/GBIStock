/// Test Data
struct TestData {
    
    /// stocks
    static let manulife = Stock(name: "Manulife Financial Corporation", symbol: "MFC", price: 20.12)
    static let tesla = Stock(name: "Tesla Inc.", symbol: "TSLA", price: 1.0)
    static let fb = Stock(name: "Facebook Inc.", symbol: "FB", price: 166.8)
    static let shop = Stock(name: "Shopify Inc.", symbol: "SHOP", price: 1.0)
    static let weed = Stock(name: "Canopy Growth Corporation", symbol: "WEED.TRT", price: 20.12)
    static let stock1 = Stock(name: "Stock1", symbol: "Stock1", price: 788.12)
    static let stock2 = Stock(name: "Stock2", symbol: "Stock2", price: 788.12)
    static let stock3 = Stock(name: "Stock3", symbol: "Stock3", price: 788.12)
    static let T = Stock(name: "AT&T Inc", symbol: "T", price: 788.12)
    static let MSFT = Stock(name: "Microsoft Corporation", symbol: "MSFT", price: 788.12)
    
    // holding
    
    static let tslaHolding:Holding = .init(stock: tesla, numShare: 10, purchasePrice: 400)
    static let weedHolding:Holding = .init(stock: weed, numShare: 200, purchasePrice: 23)
    static let fbHolding:Holding = .init(stock: fb, numShare: 200, purchasePrice: 160)
    static let shopHolding:Holding = .init(stock: shop, numShare: 200, purchasePrice: 20)
    /// members
    static let fan = Member(firstName: "Fan", lastName: "Yang", portfolio: [weedHolding, tslaHolding])
    static let mark = Member(firstName: "Mark", lastName: "Hsu", portfolio: [fbHolding])
    static let ankush = Member(firstName: "Ankush", lastName: "Bohra", portfolio: [shopHolding])
     static let zain = Member(firstName: "Zain", lastName: "Noor", portfolio: [tslaHolding])
    
    static func stcoks() -> [Stock] {
        return [manulife, tesla]
    }
    
    static func allStocks() -> [Stock]{
        return [manulife, tesla, weed, stock1, stock2, stock3, T, MSFT]
    }
    
    static func members() -> [Member]{
        return [fan, mark]
    }
    
    static func membersGBI() -> MembersGBI{
        return MembersGBI.init(members: [fan, mark, ankush, zain])
    }
}
