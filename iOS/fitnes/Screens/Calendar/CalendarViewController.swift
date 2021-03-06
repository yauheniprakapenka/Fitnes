//
//  CalendarViewController.swift
//  fitnes
//
//  Created by yauheni prakapenka on 08.08.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit
import FSCalendar

// FSCalendar tutorial - https://www.youtube.com/watch?v=FipNDF7g9tE
// NSDateFormatter - https://nsdateformatter.com/

// MARK: - Constants

private extension CalendarViewController {
    enum Const {
        static let screenSize: CGRect = UIScreen.main.bounds
        static let widthScreen: CGFloat = screenSize.width
        
        static let actionMessage = "Добавить тренировку"
        static let cancelMessage = "Отменить тренировку"
        static let activeColor = #colorLiteral(red: 0.4109300077, green: 0.4760656357, blue: 0.9726527333, alpha: 1)
        static let cancelColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        static let cell = "cell"
    }
}

class CalendarViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var calendar: FSCalendar!
    private var formatter = DateFormatter()
    private let tableView = UITableView()
    private let emptyStateImageView = FImageView(frame: .zero)
    private let horisontalLineView = FViewHorisontalLine()
    private var filteredCalendarTrainingModel: [CalendarTrainingModel] = []
    private let addTrainingButton = FButtonWithBackgroundColor(backgroundColor: Const.activeColor, title: Const.actionMessage, size: 18)
    private var selectedDay: CalendarTrainingModel?
    private let alertVC = AlertWithImageViewController(title: "Укажите время тренировки",
                                                      description: "Атлеты будут видеть время проведения ваши тренировок",
                                                      placeholder: "Например, 10:00 - 18:00",
                                                      image: #imageLiteral(resourceName: "fitnes-illustration"),
                                                      position: .leftTop)
    
    private var calendarTrainingModel: [CalendarTrainingModel] = [
        CalendarTrainingModel(date: "Wednesday-16-Sep-2020", description: "12:00 - 18:00 | Сегодня будем слушать много современного рэпчика еее"),
        CalendarTrainingModel(date: "Thursday-17-Sep-2020", description: "14:00 - 19:00 |  Отрабатываем наклоны"),
        CalendarTrainingModel(date: "Friday-18-Sep-2020", description: "11:00 - 15:00 | Езда на велосипеде"),
        CalendarTrainingModel(date: "Monday-21-Sep-2020", description: "14:00 - 22:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Friday-21-Aug-2020", description: "12:00 - 18:00 | Тренировка «Пешком в Мордор». Взять кольца и провизию"),
        CalendarTrainingModel(date: "Wednesday-21-Sep-2020", description: "09:00 - 18:00 | Отрабатываем наклоны"),
        CalendarTrainingModel(date: "Wednesday-23-Sep-2020", description: "12:00 - 18:30 | Езда на велосипеде"),
        CalendarTrainingModel(date: "Friday-28-Aug-2020", description: "09:00 - 22:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Friday-25-Sep-2020", description: "12:00 - 18:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Monday-28-Sep-2020", description: "09:00 - 21:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Wednesday-30-Sep-2020", description: "12:30 - 15:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Saturday-03-Oct-2020", description: "09:00 - 18:00 | Отрабатываем наклоны"),
        CalendarTrainingModel(date: "Monday-05-Oct-2020", description: "12:00 - 18:30 | Езда на велосипеде"),
        CalendarTrainingModel(date: "Tuesday-06-Oct-2020", description: "09:00 - 22:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Wednesday-07-Oct-2020", description: "12:00 - 18:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте"),
        CalendarTrainingModel(date: "Saturday-10-Oct-2020", description: "09:00 - 21:00 | Бег 400 метров, тренировка с канатом, езда на велосипеде, прыжки на батуте")
        
    ]
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureNavigation()
        configureCalendar()
        configureHorisontalLineView()
        setupTableView()
        configureEmptyStateImageView()
        
        if apiGetUserModel.trainer {
            configureAddTrainingButton()
        }
    }
}

// MARK: - Private methods

private extension CalendarViewController {

    func printIsTrainingExist(date: String) {
        if filteredCalendarTrainingModel.count > 0 {
            if date == filteredCalendarTrainingModel[0].date {
                print("\nЕсть тренировка")
                print(filteredCalendarTrainingModel)
            }
        } else {
            print("\nНет тренировки")
        }
    }
    
    func configureAddTrainingButton() {
        view.addSubview(addTrainingButton)
        
        NSLayoutConstraint.activate([
            addTrainingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            addTrainingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            addTrainingButton.heightAnchor.constraint(equalToConstant: 50),
            addTrainingButton.widthAnchor.constraint(equalToConstant: Const.widthScreen / 2)
        ])
        
        addTrainingButton.addTarget(self, action: #selector(addTrainingButtonTapped), for: .touchUpInside)
    }
    
    func configureCalendar() {
        calendar = FSCalendar(frame: CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: 300))
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
        calendar.locale = Locale(identifier: "ru")
        
        view.addSubview(calendar)
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Расписание тренера"
        
        let cancelButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(navigationCancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    func configureHorisontalLineView() {
        view.addSubview(horisontalLineView)
        horisontalLineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 410).isActive = true
        horisontalLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        horisontalLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        horisontalLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func configureEmptyStateImageView() {
        view.addSubview(emptyStateImageView)
        emptyStateImageView.topAnchor.constraint(equalTo: horisontalLineView.bottomAnchor, constant: 40).isActive = true
        emptyStateImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyStateImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5).isActive = true
        emptyStateImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
}

// MARK: - Actions

private extension CalendarViewController {
    
    @objc
    func addTrainingButtonTapped() {
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.modalTransitionStyle = .crossDissolve
        
        alertVC.actionButton.addTarget(self, action: #selector(alertActionButtonTapped), for: .touchUpInside)
        alertVC.cancelButton.addTarget(self, action: #selector(alertCancelButtonTapped), for: .touchUpInside)
        
        present(alertVC, animated: true)
    }
    
    @objc
    func alertActionButtonTapped() {
        
        guard var day = selectedDay else { return }
        day.description = alertVC.userInputTextfield.text ?? ""
        calendarTrainingModel.append(day)
        
        filteredCalendarTrainingModel = calendarTrainingModel.filter({
            $0.date.contains(day.date)
        })
        
        printIsTrainingExist(date: day.date)
        
        tableView.reloadData()
        
        dismiss(animated: true, completion: {
            self.alertVC.userInputTextfield.text = ""
        })
    }
    
    @objc
    func alertCancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc
    func navigationCancelButtonTapped() {
        dismiss(animated: true)
    }
}

// MARK: - FS Calendar Delegate

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        HapticFeedback.shared.make(type: .light)
        
        formatter.dateFormat = "EEEE-dd-MMM-yyyy"
        let formattedData = formatter.string(from: date)
        print(formattedData)
        
        selectedDay = CalendarTrainingModel(date: formattedData, description: "")
        
        filteredCalendarTrainingModel = calendarTrainingModel.filter({
            $0.date.contains(formatter.string(from: date))
        })
        
        printIsTrainingExist(date: formatter.string(from: date))
        
        tableView.reloadData()
    }
}

// MARK: - FS Calendar Data Source

extension CalendarViewController: FSCalendarDataSource {
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
}

// MARK: - UI Table View Delegate

extension CalendarViewController: UITableViewDelegate {
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = #colorLiteral(red: 0.9803171754, green: 0.9804343581, blue: 0.9802773595, alpha: 1)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: horisontalLineView.bottomAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(CalendarTrainingCell.self, forCellReuseIdentifier: Const.cell)
    }
}

// MARK: - UI Table View Data Source

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredCalendarTrainingModel.count < 1 {
            emptyStateImageView.alpha = 1
            emptyStateImageView.image = apiGetUserModel.trainer ? #imageLiteral(resourceName: "no-training-trainer") : #imageLiteral(resourceName: "no-training-athlete")
        } else {
            emptyStateImageView.alpha = 0
        }
        
        return filteredCalendarTrainingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cell, for: indexPath) as! CalendarTrainingCell
        
        cell.selectionStyle = .none
        cell.dayOfWeekLabel.text = DayOfWeekConverter.shared.convert(date: filteredCalendarTrainingModel[indexPath.row].date)
        cell.numberOfDayLabel.text = NumberOfDayConverter.shared.convert(date: filteredCalendarTrainingModel[indexPath.row].date)
        cell.monthLabel.text = MonthConverter.shared.convert(date: filteredCalendarTrainingModel[indexPath.row].date)
        cell.descriptionLabel.text = filteredCalendarTrainingModel[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
