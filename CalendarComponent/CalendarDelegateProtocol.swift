//
//  CalendarDelegateProtocol.swift
//  EventCalendar
//
//  Created by aanchal on 12/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

import Foundation
import UIKit

protocol CalendarDelegateProtocol: class {
    // Variables
    var allowsDateCellStretching: Bool {get set}
    var cachedConfiguration: ConfigurationParameters! {get set}
    var calendarDataSource: CalendarViewDataSource? {get set}
    var cellSize: CGFloat {get set}
    var anchorDate: Date? {get set}
    var isCalendarLayoutLoaded: Bool {get}
    var minimumInteritemSpacing: CGFloat  {get set}
    var minimumLineSpacing: CGFloat {get set}
    var monthInfo: [Month] {get set}
    var monthMap: [Int: Int] {get set}
    var scrollDirection: UICollectionViewScrollDirection! {get set}
    var sectionInset: UIEdgeInsets {get set}
    var totalDays: Int {get}
    var firstContentOffset: CGPoint {get}
    
    // Functions
    func pathsFromDates(_ dates: [Date]) -> [IndexPath]
    func sizeOfDecorationView(indexPath: IndexPath) -> CGRect
    func sizesForMonthSection() -> [AnyHashable:CGFloat]
    func targetPointForItemAt(indexPath: IndexPath) -> CGPoint?
}

extension CalendarView: CalendarDelegateProtocol {}
