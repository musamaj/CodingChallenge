//
//  String+Extensions.swift
//  NewsReader
//
//  Created by Usama Jamil on 28/02/2022.
//

import Foundation

extension String {
    func getFormattedDateTime() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "hh:mm"
        guard let formattedDate = date else { return "" }
        return dateFormatter.string(from: formattedDate)
    }
}
