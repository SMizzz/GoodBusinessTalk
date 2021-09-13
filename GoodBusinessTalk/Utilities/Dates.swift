//
//  Dates.swift
//  GoodBusinessTalk
//
//  Created by 신미지 on 2021/09/06.
//

import Foundation

func convertDateFormatter(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    if let convertedDate = dateFormatter.date(from: date) as Date? {
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let timeStamp = dateFormatter.string(from: convertedDate)
        return timeStamp
    }
    return ""
}

func String2DateType(string : String) -> Date?{
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd"
    
    return formatter.date(from: string)
}
