//
//  CalendarProtocols.swift
//  EventCalendar
//
//  Created by aanchal on 12/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

import Foundation
import UIKit

/// Default delegate functions
public extension CalendarViewDelegate {
    func calendar(_ calendar: CalendarView, shouldSelectDate date: Date, cell: CalendarCell?, cellState: CellState) -> Bool { return true }
    func calendar(_ calendar: CalendarView, shouldDeselectDate date: Date, cell: CalendarCell?, cellState: CellState) -> Bool { return true }
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, cell: CalendarCell?, cellState: CellState) {}
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date, cell: CalendarCell?, cellState: CellState) {}
    func calendar(_ calendar: CalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {}
    func calendar(_ calendar: CalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> CollectionReusableView {
        assert(false, "You have implemted a header size function, but forgot to implement the `headerViewForDateRange` function")
        return CollectionReusableView()
    }
    func calendar(_ calendar: CalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> CalendarCell {
        return CalendarCell()
    }
    func calendarDidScroll(_ calendar: CalendarView) {}
    func calendarSizeForMonths(_ calendar: CalendarView?) -> MonthSize? { return nil }
    func sizeOfDecorationView(indexPath: IndexPath) -> CGRect { return .zero }
    func scrollDidEndDecelerating(for calendar: CalendarView) {}
}

/// The CalendarViewDataSource protocol is adopted by an
/// object that mediates the application’s data model for a
/// the CalendarViewDataSource object. data source provides the
/// the calendar-view object with the information it needs to construct and
/// then modify it self
public protocol CalendarViewDataSource: class {
    /// Asks the data source to return the start and end boundary dates
    /// as well as the calendar to use. You should properly configure
    /// your calendar at this point.
    /// - Parameters:
    ///     - calendar: The Calendar view requesting this information.
    /// - returns:
    ///     - ConfigurationParameters instance:
    func configureCalendar(_ calendar: CalendarView) -> ConfigurationParameters
}

/// The delegate of a CalendarView object must adopt the
/// CalendarViewDelegate protocol Optional methods of the protocol
/// allow the delegate to manage selections, and configure the cells
public protocol CalendarViewDelegate: class {
    /// Asks the delegate if selecting the date-cell with a specified date is
    /// allowed
    /// - Parameters:
    ///     - calendar: The Calendar view requesting this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///     - cellState: The month the date-cell belongs to.
    /// - returns: A Bool value indicating if the operation can be done.
    func calendar(_ calendar: CalendarView, shouldSelectDate date: Date, cell: CalendarCell?, cellState: CellState) -> Bool
    
    /// Asks the delegate if de-selecting the
    /// date-cell with a specified date is allowed
    /// - Parameters:
    ///     - calendar: The Calendar view requesting this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///     - cellState: The month the date-cell belongs to.
    /// - returns: A Bool value indicating if the operation can be done.
    func calendar(_ calendar: CalendarView, shouldDeselectDate date: Date, cell: CalendarCell?, cellState: CellState) -> Bool
    
    /// Tells the delegate that a date-cell with a specified date was selected
    /// - Parameters:
    ///     - calendar: The Calendar view giving this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///             This may be nil if the selected cell is off the screen
    ///     - cellState: The month the date-cell belongs to.
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, cell: CalendarCell?, cellState: CellState)
    /// Tells the delegate that a date-cell
    /// with a specified date was de-selected
    /// - Parameters:
    ///     - calendar: The Calendar view giving this information.
    ///     - date: The date attached to the date-cell.
    ///     - cell: The date-cell view. This can be customized at this point.
    ///             This may be nil if the selected cell is off the screen
    ///     - cellState: The month the date-cell belongs to.
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date, cell: CalendarCell?, cellState: CellState)
    
    /// Tells the delegate that the Calendar view
    /// scrolled to a segment beginning and ending with a particular date
    /// - Parameters:
    ///     - calendar: The Calendar view giving this information.
    ///     - startDate: The date at the start of the segment.
    ///     - endDate: The date at the end of the segment.
    func calendar(_ calendar: CalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo)
    
    /// Tells the delegate that the Calendar is about to display
    /// a date-cell. This is the point of customization for your date cells
    /// - Parameters:
    ///     - calendar: The Calendar view giving this information.
    ///     - date: The date attached to the cell.
    ///     - cellState: The month the date-cell belongs to.
    ///     - indexPath: use this value when dequeing cells
    func calendar(_ calendar: CalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> CalendarCell
    
    /// Tells the delegate that the Calendar is about to
    /// display a header. This is the point of customization for your headers
    /// - Parameters:
    ///     - calendar: The Calendar view giving this information.
    ///     - date: The date attached to the header.
    ///     - indexPath: use this value when dequeing cells
    func calendar(_ calendar: CalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> CollectionReusableView
    
    /// Informs the delegate that the user just lifted their finger from swiping the calendar
    func scrollDidEndDecelerating(for calendar: CalendarView)
    
    /// Tells the delegate that a scroll occured
    func calendarDidScroll(_ calendar: CalendarView)
    
    /// Called to retrieve the size to be used for the month headers
    func calendarSizeForMonths(_ calendar: CalendarView?) -> MonthSize?
    
    /// Implement the function to configure calendar cells. The code that will go in here is the same
    /// that you will code for your cellForItem function. This function is only called to address
    /// inconsistencies in the visual appearance as stated by Apple: https://developer.apple.com/documentation/uikit/uicollectionview/1771771-prefetchingenabled
    /// a date-cell. This is the point of customization for your date cells
    /// - Parameters:
    ///     - calendar: The Calendar view giving this information.
    ///     - cell: The cell
    ///     - date: date attached to the cell
    ///     - cellState: The month the date-cell belongs to.
    ///     - indexPath: use this value when dequeing cells
    func calendar(_ calendar: CalendarView, willDisplay cell: CalendarCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath)
    
    /// Called to retrieve the size to be used for decoration views
    func sizeOfDecorationView(indexPath: IndexPath) -> CGRect
}
