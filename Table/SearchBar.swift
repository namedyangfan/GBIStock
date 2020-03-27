//
//  SearchBarTest.swift
//  Table
//
//  Created by Fan Yang on 2020-03-20.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct SearchBar: View {
    @Binding var text: String
    @Binding var searchStocks: [Stock]
    
    var body: some View {

        HStack {
            TextField("Start typing",
                      text: $text,
                      onCommit: { self.symbolSearch() })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: { self.symbolSearch() }) {
                Image(systemName: "magnifyingglass")
            }
        }   .padding()
    }
    
    func symbolSearch() -> Void{
        print("Alamofire")
        let request = AF.request("https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(text)&apikey=4GIXFE9SBIV8IYYZ")
        request.responseData{ response in
            let json =  try! JSON(data:response.data!)
            self.searchStocks = json["bestMatches"].map{ match in
                Stock(name: match.1["2. name"].stringValue, symbol: match.1["1. symbol"].stringValue, price: 1.0)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), searchStocks: .constant(TestData.allStocks()))
    }
}
