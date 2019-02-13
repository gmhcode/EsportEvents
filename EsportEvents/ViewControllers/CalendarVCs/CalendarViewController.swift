//
//  CalendarViewController.swift
//  EsportEvents
//
//  Created by Greg Hughes on 2/6/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
import JTAppleCalendar
import CoreGraphics
class CalendarViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var swipeRightGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    
    
    var previousDate : Date?
    var dateRange : [Date]?
    var datesWithEvents: [String] = []
    var events : [UpcomingTourny] = []
    var dateEvents : [[UpcomingTourny]] = []
    var swipeRight = true
    
    
    let todayDate = Date()
    let upcomingTourny = UpcomingTourny.self
    let formatter = DateFormatter()
    
    
    var gameSpecificEventsFromServer: [Date:[UpcomingTourny]] = [:] {
        didSet {
            tableView.reloadData()
        }
    }
    var allEventsFromServer: [Date:[UpcomingTourny]] = [:] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    var currentImageGameName : String {
        guard let visibleCell = gameTitleCollectionView.visibleCells.first as? GameTitleCollectionViewCell, let currentImageGameName = visibleCell.gameTitleImages else { return "" }
        
        //        other = currentImageGameName
        
        return currentImageGameName
        
    }
    
    
    
    //    MARK: TableView Sources
    @IBOutlet weak var tableView: UITableView!
    var dateSections: [Date] {
        var dateSections: [Date] = []
        //sets all the dates in order by date
        for (date, _) in gameSpecificEventsFromServer.sorted(by: {$0.key < $1.key})
        {
            if !dateSections.contains(date) {
                dateSections.append(date)
            }
        }
        if swipeRight == true{
            previousDate = dateSections.first
        }else{
            previousDate = dateSections.last
        }
        // vv MADE CELL DOTS APPEAR
        
        calendarView.reloadData()
        
        return dateSections
    }
    
    // all events sorted by date
    var pastAndFutureEvents: [Date] {
        var pastAndFutureEvents : [Date] = []
        
        for (date,_) in allEventsFromServer.sorted(by: {$0.key < $1.key}){
            
            if !pastAndFutureEvents.contains(date){
                pastAndFutureEvents.append(date)
            }
        }
        return pastAndFutureEvents
    }
    
    
    
    //   MARK: GameTitleCollectionView sources
    let gameTitleImages = ["Dota 2", "PUBG", "CS:GO", "LoL", "Overwatch"]
    @IBOutlet weak var gameTitleCollectionView: UICollectionView!
    
    
    
  // side menu
    @IBOutlet weak var sideMenu: UIView!
    
    @IBOutlet weak var sideMenuNotRound: UIView!
    @IBOutlet weak var sideMenuRound: UIView!
    @IBOutlet weak var dismissSideMenuButton: UIButton!
    
    @IBOutlet weak var sideMenuButton1: UIButton!
    @IBOutlet weak var sideMenuButton2: UIButton!
    @IBOutlet weak var sideMenuButton3: UIButton!
    @IBOutlet weak var sideMenuButton4: UIButton!
    @IBOutlet weak var sideMenuButton6: UIButton!
    @IBOutlet weak var sideMenuButton7: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //vv this is when the fetch is called
        self.calendarView.scrollToDate(Date(), animateScroll: false)
//        setGestureRecpgnizer()
        setDelegatesAndViews()
        //vv open with todays date highlighted
        self.calendarView.selectDates([Date()])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            
            self.getServerEvents { (allTournaments, tournaments)  in
                guard let tournaments = tournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                
                self.gameSpecificEventsFromServer = tournaments
//                self.calendarView.reloadData()
            }
        }
        self.navigationController?.isNavigationBarHidden = true
    }
    //
    //    override func viewWillAppear(_ animated: Bool) {
    ////        super.viewWillAppear(animated)
    ////        self.tableView.reloadData()
    ////        self.calendarView.reloadData()
    //    }
    
    //loads current date on viewDidLoad
    func setupCalendarView(completion: @escaping (Bool) -> Void){
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // MARK: - makes the spacing between days 0
        
    }
    
    func setDelegatesAndViews(){
        gameTitleCollectionView.delegate = self
        gameTitleCollectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
        let calendarTVCNib = UINib(nibName: "CalendarEventCell", bundle: nil)
        tableView.register(calendarTVCNib, forCellReuseIdentifier: "gameEventCell")
        sideMenuRound.layer.cornerRadius = self.view.frame.width/1.2
        hideMenu()
        self.navigationController?.isNavigationBarHidden = true
            }
    
    @IBAction func sideMenuButtonTapped(_ sender: Any) {
        view.bringSubviewToFront(sideMenuRound)
        showMenu()
        
       
    }
    @IBAction func dismissSideMenuButtonTapped(_ sender: Any) {
        hideMenu()
    }
    
    
    
    func getServerEvents(completion: @escaping ([Date:[UpcomingTourny]]?, [Date:[UpcomingTourny]]?) -> Void) {
        
        //        print(dateRange)
        guard let dateRange = dateRange,
            let first = dateRange.first,
            let last = dateRange.last else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        //        print("🎡🚚   \(dateRange.first)")
        //        var scheduledTournaments = [Date: [UpcomingTourny]]()
        
        
        
        
        NetworkCall.shared.fetchTournaments { (fetchedTournaments) in
            DispatchQueue.main.async {
                
                
                guard let fetchedTournaments = fetchedTournaments else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
                
                var allTournaments: [Date: [UpcomingTourny]] = [:]
                var tournaments: [Date: [UpcomingTourny]] = [:]
                
                
                if fetchedTournaments.isEmpty == false {
                    //                print("🔥❇️\(fetchedTournaments)")
                    
                    
//                    print(fetchedTournaments)
                    
                    for tournament in fetchedTournaments{
                        
                        guard let tournamentDate = tournament.beginTime?.asCrazyDate,
                            let tournamentName = tournament.videoGame.name
                            else { continue }
                        
                        
//                        print("❗️❌🔥\(tournamentDate)")
                        
                        if tournaments.keys.contains(tournamentDate){
                            
                            allTournaments[tournamentDate]?.append(tournament)
                            
                            
                        } else {
                            if tournamentName.contains(self.currentImageGameName) {
                                allTournaments[tournamentDate] = [tournament]
                                //
                            }
                        }
                        //                    print("  ❌🔥🤥 \(tournamentDateStringPre)")
                        if tournaments.keys.contains(tournamentDate){
                            
                            tournaments[tournamentDate]?.append(tournament)
                            
                            
                        } else {
                            
                            if tournamentDate >= first && tournamentDate <= last && tournamentName.contains(self.currentImageGameName) {
                                tournaments[tournamentDate] = [tournament]
                                //
                            }
                        }
                    }
                    
                }
                self.allEventsFromServer = allTournaments
                completion(allTournaments, tournaments)
                
                self.view.setNeedsLayout()
                self.calendarView.reloadData()
                //                scheduledTournaments = tournaments
                //                print(" ❌🔥 \(scheduledTournaments)")
                //                serverEvents
            }
        }
    }
    
    
    
    
    //        EventController.shared.fetchEvents(withDateRangeStartingAt: first.timeIntervalSince1970, ending: last.timeIntervalSince1970) { (fetchedEvents) in
    //            if !fetchedEvents.isEmpty {
    //
    //                EventController.shared.events = fetchedEvents
    //
    //                var events: [Date: [Event]] = [:]
    //
    //                let myGroup = DispatchGroup()
    //
    //                for event in fetchedEvents {
    //
    //                    let eventDate = Date(timeIntervalSince1970: TimeInterval(Int(event.date)))
    //
    //                    if events.keys.contains(eventDate) {
    //
    //                        events[eventDate]?.append(event)
    //                    } else {
    //
    //                        events[eventDate] = [event]
    //                    }
    //                }
    //
    //                serverEvents = events
    //                self.dateEventObjects = events
    //                self.view.setNeedsLayout()
    //
    //                completion(serverEvents)
    //            }
    //        }
    
    
    // MARK: - Calendar vv handles colors for all textb
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState){
        
        guard let validCell = view as? CalendarCell else { return }
        
        if cellState.isSelected{
            validCell.dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            //sets color of text for selected days
        } else {
            if cellState.dateBelongsTo == .thisMonth{
                //set color for cells of this month
                validCell.dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                validCell.dateLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                //sets colors outside this month but still in view
            }
        }
    }
    // MARK: - Calendar vv toggles the color change in selected cells
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CalendarCell else { return }
        if cellState.isSelected {
            validCell.selectedView.isHidden = false
        } else {
            validCell.selectedView.isHidden = true
        }
        
    }
    //    month and year label
    func setUpViewsOfCalendar(from visibleDates: DateSegmentInfo){
        let date = visibleDates.monthDates.first!.date
        
        //        self.formatter.dateFormat = "yyyy"
        //        self.year.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM yyyy"
        //        self.month.text = self.formatter.string(from: date)
        
        
        dateLabel.text = self.formatter.string(from: date)
        self.navigationItem.title = self.formatter.string(from: date)
        navigationController?.navigationBar.barTintColor = UIColor.white
        //SETS THE MONTH TEXT WHEN SWIPED
    }
    
    func cellDotsAppear(cell: JTAppleCell?, cellState: CellState){
        
        guard let cell = cell as? CalendarCell else { return }
        
        formatter.dateFormat = "yyyy MM dd"
        
        handleCellEvents(cell: cell, cellState: cellState)
        
    }
    
    // MARK: - Calander Dot activates if we get info from server
    func handleCellEvents(cell: CalendarCell?, cellState: CellState){
        cell?.dot.isHidden = !gameSpecificEventsFromServer.contains(where: { (key, value) -> Bool in
            
            let keyDate = Date(timeIntervalSince1970: key.timeIntervalSince1970)
            let keyDateComponent = Calendar.current.dateComponents([.day, .month, .year], from: keyDate)
            
            let cellStateDate = Date(timeIntervalSince1970: cellState.date.timeIntervalSince1970)
            let cellStateComponent = Calendar.current.dateComponents([.day, .month, .year], from: cellStateDate)
            return keyDateComponent == cellStateComponent
        })
        
        if cell?.dot.isHidden == false{
            //            print("🔥\(cellState.date.asString)")
            
            //extract all datesWithEvents if dot is hidden
            datesWithEvents.append(cellState.date.asString)
            
            
//            calendarView.setNeedsLayout()
            self.view.setNeedsLayout()
//            calendarView.reloadData()
        }
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate{
    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CalendarCell
        
        cell.dateLabel.text = cellState.text
        
        handleCellTextColor(view: cell, cellState: cellState)
        // MARK: - Calendar resets cells when moving between months
        handleCellSelected(view:  cell, cellState: cellState)
        cellDotsAppear(cell: cell, cellState: cellState)
        
        return cell
    }
    
    // MARK: - Calendar color change when selecting and de-selecting
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        
        //play with dates here, configure
        print(date.asString)
        print(date)
        
        handleCellSelected(view:  cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        cellDotsAppear(cell: cell, cellState: cellState)
//        calendarView.reloadData()
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {

        handleCellSelected(view:  cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        cellDotsAppear(cell: cell, cellState: cellState)
    }
    
    
    
    //VV swipe action
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setUpViewsOfCalendar(from: visibleDates)
//        calendar.scrollToDate(Date())
        let previousDateRange = dateRange
        
        
        let dateArray = printVisibleDates(visibleDatesMonthDates: visibleDates.monthDates)
        
        dateRange = dateArray

//       determines whether user swiped right or left
        if let previousDateRange = previousDateRange {
            if previousDateRange[0] > (dateRange?.last)! {
                swipeRight = true
                print("prev Date Range ⛽️\(previousDateRange)")
            } else {
                swipeRight = false
//                print("prev Date Range ⛽️\(previousDateRange)")
            }
        }
        
        //        print(" ❇️ \(String(describing: dateRange)) ")
        self.getServerEvents(completion: { (allTournaments, tournaments) in
            DispatchQueue.main.async {
                guard let tournaments = tournaments, let allTournaments = allTournaments else { print(">>>\(#file) \(#line): guard let failed <<<"); return }
                
//                print("🔥❌\(allTournaments)")
                
                if tournaments.keys.count != 0  {
                self.gameSpecificEventsFromServer = tournaments
                    
                } else  {
                    self.gameSpecificEventsFromServer = allTournaments
                    //gspec
                    
                    let nextDate = self.findNearestDate(datesToSift: self.pastAndFutureEvents, currentDateRange: self.dateRange!, swipeRight: self.swipeRight)
//                    print("NextDate 🛶\(nextDate)")
//                    print("previous date🏓\(self.previousDate)")
                    
                    if self.previousDate == nextDate{
                        //PRESENT ALERT
                        self.presentNoFurtherDateAlert(actionHandler: { (_) in
                            self.previousDate = nextDate
                            calendar.scrollToDate(nextDate)
                            
                        })
                    }
//                    self.calendarView.reloadData()
                    //TODO: make left and right gesture recognizers to set the swipe right value to true or false
//                    print("🔥🛳\(self.pastAndFutureEvents)")
                }
            }
        })
        
    }

    
}

extension CalendarViewController: JTAppleCalendarViewDataSource{
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CalendarCell
        

        
        cell.dateLabel.text = cellState.text
    }
    //"2017-12-07T00:00:00Z
    
    
    // MARK: - Configuring Dates
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        formatter.date(from: "2017 01 01")
        
        let startDate = formatter.date(from: "2017 01 01")
        let endDate = formatter.date(from: "2200 12 31")
        
        guard let sDate = startDate, let eDate = endDate else { return ConfigurationParameters(startDate: Date(), endDate: Date()) }
        // MARK: - showing buggy Date
        
        let parameters = ConfigurationParameters(startDate: sDate, endDate: eDate, numberOfRows: 5, calendar: Calendar.current, generateInDates: .forAllMonths, generateOutDates: .tillEndOfRow, firstDayOfWeek: .monday)
        return parameters
        
    }
}

extension UIColor{
    convenience init(colorWithHexValue value: Int, alpha: CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x000FF) / 255.0,
            alpha: alpha
            // MARK: - Calendar allows us to use hex values...?
        )
    }
}
