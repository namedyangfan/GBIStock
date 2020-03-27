//
//  DataLayer.swift
//  Table
//
//  Created by Fan Yang on 2020-03-20.
//  Copyright © 2020 Fan Yang. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class DataLayer: ObservableObject {
    func symbolSrach(searchString: String) -> [Stock]{
        print("Alamofire")
        let request = AF.request("https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo")
        request.responseData{ response in
            let json =  try! JSON(data:response.data!)
            let matchStocks = json["bestMatches"].map{ match in
                Stock(name: match.1["2. name"].stringValue, symbol: match.1["1. symbol"].stringValue, price: 1.0)
            }
            return matchStocks
        }
    }
}
