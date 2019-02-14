//
//  CalendarHelperFunctions.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/11/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit

extension CalendarViewController{
    
    func findNearestDate(datesToSift: [Date], currentDateRange: [Date], swipeRight: Bool) -> Date{
        
        let swipeRight = swipeRight
        let rangeCount = currentDateRange.count - 1
        let siftCount = datesToSift.count - 1
        
        
        //        print("current date range:❇️\(currentDateRange)❇️♊️")
//                print("to sift🥕\(datesToSift)")
        
        if datesToSift[0] > currentDateRange[rangeCount] {
//            print(datesToSift)
            return datesToSift[0]
        }
        if datesToSift [siftCount] < currentDateRange[0]  {
            return datesToSift[siftCount]
        }
        var datesLessThanArray : [Date] = []
        
        var datesGreaterThanArray : [Date] = []
        
        for date in datesToSift {
            if date < currentDateRange[0]{
                datesLessThanArray.append(date)
            } else if date > currentDateRange[rangeCount] {
                datesGreaterThanArray.append(date)
            }
        }
        
        let lessThanCount = datesLessThanArray.count - 1
        
//        print(datesLessThanArray)
//        print(datesGreaterThanArray)
        //                print(lessThanCount)
        if swipeRight == true {
            return datesLessThanArray[lessThanCount]
        } else {
            return datesGreaterThanArray[0]
        }
        
    }
    //use this to extract all the dates from the month
    func printVisibleDates(visibleDatesMonthDates: [(Date,IndexPath)]) -> [Date]{
        
        var i = 0
        var dateArray : [Date] = []
        
        
        while i < visibleDatesMonthDates.count{
            dateArray.append(visibleDatesMonthDates[i].0)
            i += 1
        }
        return dateArray
    }
    
    func presentNoFurtherDateAlert(actionHandler: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: "No events beyond this point", message: "There arent any tournaments on record beyond this point.", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: actionHandler))
        
        present(alertController, animated: true)
        
    }
}
