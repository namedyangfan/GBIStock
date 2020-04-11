//
//  StcokViewRow.swift
//  Table
//
//  Created by Fan Yang on 2020-03-03.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI
import Foundation

struct StockViewRow: View {
    var holding: Holding
    @State private var quote: Quote?
    
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                Text(holding.stock.symbol)
              .font(.system(size:20))
                Text(holding.stock.name)
                .font(.system(size:14))
            }
   
            Spacer()
            quoteText
        }
        .padding(.leading)
        .padding(.trailing)
        .onAppear(perform: loadData)
    }
    
    private var quoteText: some View {
        if let percentChange = self.quote?.globalQuote.percentChange {
            if percentChange >= "0" {
                let percentChangeText = Text("+\(percentChange)").foregroundColor(.green)
                return percentChangeText
            } else {
                let percentChangeText = Text(percentChange).foregroundColor(.red)
                return percentChangeText
            }
        } else {
            return Text("")
        }
//        if let quote = self.quote {
//            if(holding.dailyGain() > 0){
//                let percentChangeText = Text(quote.globalQuote.percentChange)
//                return percentChangeText
//            } else {
//                let percentChangeText = Text(quote.globalQuote.percentChange)
////                    .foregroundColor(.red)
////                    .cornerRadius(8)
////                    .font(.system(size: 20))
////                    .padding(.all, 10)
//                return percentChangeText
//            }
//        } else {
//        return EmptyView()
//        }
    }
    
    func loadData() {
//        1 create url we want
        guard let url = URL(string: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(self.holding.stock.symbol)&apikey=4GIXFE9SBIV8IYYZ") else {
            print("Invalid URL")
            return
        };
//        2 wrape url into URLRequest
        let request = URLRequest(url: url)
//        3 start network task
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decodeResponse = try? JSONDecoder().decode(Quote.self, from: data) {
                    DispatchQueue.main.async {
                        self.quote = decodeResponse
                    }
                    return
                }
            }
            print("Request to Quote Failed")
        }.resume()
    }
}

struct Quote: Codable {
    var globalQuote: GlobalQuote
    
    private enum CodingKeys : String, CodingKey {
        case globalQuote = "Global Quote"
    }
    
    struct GlobalQuote: Codable {
        var price: String
        var percentChange: String
        
        private enum CodingKeys : String, CodingKey {
            case price = "05. price", percentChange="10. change percent"
        }
    }
}
struct StockViewRow_Previews: PreviewProvider {
    static var previews: some View {
        StockViewRow(holding: TestData.tslaHolding)
    }
}
