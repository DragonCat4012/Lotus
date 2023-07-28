//
//  Date.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import Foundation

extension Date {

    func cleanDate() -> Date {
        let calendar = Calendar.current
        let currentDate = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        var components = DateComponents()
        
        components.year = currentDate.year
        components.month = currentDate.month
        components.day = currentDate.day
        
        components.hour = 0
        components.minute = 0
        components.second = 0
        let date = Calendar.current.date(from: components)
        return date!
    }
}
