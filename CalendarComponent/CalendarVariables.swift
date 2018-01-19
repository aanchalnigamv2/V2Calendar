//
//  CalendarVariables.swift
//  EventCalendar
//
//  Created by aanchal on 12/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

import Foundation
import UIKit

// Calculated Variables
extension CalendarView {
    /// Workaround for Xcode bug that prevents you from connecting the delegate in the storyboard.
    /// Remove this extra property once Xcode gets fixed.
    @IBOutlet public var ibCalendarDelegate: AnyObject? {
        get { return calendarDelegate }
        set { calendarDelegate = newValue as? CalendarViewDelegate }
    }
    
    /// Workaround for Xcode bug that prevents you from connecting the delegate in the storyboard.
    /// Remove this extra property once Xcode gets fixed.
    @IBOutlet public var ibCalendarDataSource: AnyObject? {
        get { return calendarDataSource }
        set { calendarDataSource = newValue as? CalendarViewDataSource }
    }
    
    @available(*, unavailable)
    /// Will not be used by subclasses
    open override var delegate: UICollectionViewDelegate? {
        get { return super.delegate }
        set { /* Do nothing */ }
    }
    
    @available(*, unavailable)
    /// Will not be used by subclasses
    open override var dataSource: UICollectionViewDataSource? {
        get { return super.dataSource }
        set {/* Do nothing */ }
    }
    
    /// Returns all selected dates
    open var selectedDates: [Date] {
        return selectedDatesSet.sorted()
    }
    
    var selectedDatesSet: Set<Date> {
        return Set(selectedCellData.values.map { $0.date })
    }
    
    var monthInfo: [Month] {
        get { return theData.months }
        set { theData.months = monthInfo }
    }
    
    var numberOfMonths: Int {
        return monthInfo.count
    }
    
    var totalDays: Int {
        return theData.totalDays
    }
    
    var calendarViewLayout: CalendarLayout {
        guard let layout = collectionViewLayout as? CalendarLayout else {
            developerError(string: "Calendar layout is not of type CalendarLayout.")
            return CalendarLayout(withDelegate: self)
        }
        return layout
    }
    
    var functionIsUnsafeSafeToRun: Bool {
        return !isCalendarLayoutLoaded || isScrollInProgress || isReloadDataInProgress
    }
    
    var isCalendarLayoutLoaded: Bool { return calendarViewLayout.isCalendarLayoutLoaded }
    var startDateCache: Date         { return cachedConfiguration.startDate }
    var endDateCache: Date           { return cachedConfiguration.endDate }
    var calendar: Calendar           { return cachedConfiguration.calendar }
    
    
    
}
