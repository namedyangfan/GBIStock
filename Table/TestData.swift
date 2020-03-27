/// Test Data
struct TestData {
    
    /// stocks
    static let manulife = Stock(name: "Manulife", symbol: "MFC", price: 20.12)
    static let tesla = Stock(name: "Tesla", symbol: "TSLA", price: 788.12)
    static let weed = Stock(name: "Weed", symbol: "Weed", price: 788.12)
    static let stock1 = Stock(name: "Stock1", symbol: "Stock1", price: 788.12)
    static let stock2 = Stock(name: "Stock2", symbol: "Stock2", price: 788.12)
    static let stock3 = Stock(name: "Stock3", symbol: "Stock3", price: 788.12)
    static let T = Stock(name: "AT&T Inc", symbol: "T", price: 788.12)
    static let MSFT = Stock(name: "Microsoft Corporation", symbol: "MSFT", price: 788.12)

    /// members
    static let fan = Member(firstName: "Fan", lastName: "Yang", stocks: [manulife, tesla])
    static let mark = Member(firstName: "Mark", lastName: "Hsu", stocks: [MSFT, stock2])
    
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
        return MembersGBI.init(members: [fan, mark])
    }
}
