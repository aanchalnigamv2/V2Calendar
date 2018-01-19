//
//  ViewController.swift
//  V2Calendar
//
//  Created by aanchal on 19/01/18.
//  Copyright © 2018 aanchal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calendarView: CalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let formatter = DateFormatter()
    let todaysDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCalendarView()
        tableView.isHidden = true
    }
    
    @IBAction func todayButtonClicked(_ sender: Any) {
        calendarView.scrollToDate(Date(), animateScroll: true)
        calendarView.selectDates([Date()])
    }
    
    func setCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        calendarView.scrollToDate(Date(), animateScroll: false)
        calendarView.selectDates([Date()])
        calendarView.visibleDates { (visibleDates) in
            self.setMonthForCalendar(visibleDates: visibleDates)
        }
    }
    
    func setMonthForCalendar(visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first?.date
        
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date!)
        
        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date!)
    }
    
    func handleCellTextColor(view: CalendarCell?, cellState: CellState) {
        guard let dateCell = view as? DateCell else { return }
        
        formatter.dateFormat = "yyyy MM dd"
        let todaysDateString = formatter.string(from: todaysDate)
        let monthDateString = formatter.string(from: cellState.date)
        
        if todaysDateString == monthDateString {
            dateCell.dateLabel.textColor = UIColor.blue
        }else {
            if cellState.dateBelongsTo == .thisMonth {
                dateCell.dateLabel.textColor = cellState.isSelected ? UIColor.black : UIColor.white
            }else {
                dateCell.dateLabel.textColor = UIColor.gray
            }
        }
    }
    
    func handleCellSelection(view: CalendarCell?, cellState: CellState) {
        guard let dateCell = view as? DateCell else {return }
        dateCell.selectedView.isHidden = cellState.isSelected ? false : true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: CalendarViewDataSource {
    
    func configureCalendar(_ calendar: CalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2016 01 01")!
        let endDate = formatter.date(from: "2018 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}

extension ViewController: CalendarViewDelegate {
    
    func calendar(_ calendar: CalendarView, willDisplay cell: CalendarCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        print("Date Cell")
    }
    
    func calendar(_ calendar: CalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> CalendarCell {
        let cell = calendar.dequeueReusableCalendarCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        cell.dateLabel.text = cellState.text
        
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: CalendarView, didSelectDate date: Date, cell: CalendarCell?, cellState: CellState) {
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: CalendarView, didDeselectDate date: Date, cell: CalendarCell?, cellState: CellState) {
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: CalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setMonthForCalendar(visibleDates: visibleDates)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        cell.textLabel?.text = "Events Info"
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
}

