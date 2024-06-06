//
//  Date+Extention.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 18/04/24.
//

import Foundation
extension Date {
    
    func toSting() -> String{
        let dateFormattor = DateFormatter()
        dateFormattor.dateStyle  = .short
        dateFormattor.timeStyle = .short
        let result  = dateFormattor.string(from: self)
        return result
    }
}
