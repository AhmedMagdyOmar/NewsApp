//
//  DatePickerViewController.swift
//  Son App
//
//  Created by youssef on 1/25/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

protocol SendSelectedDateProtocol: AnyObject {
    func selected(date: String)
    func selected(time: String)
}


class DatePickerViewController: UIViewController {
    
    private weak var delegate: SendSelectedDateProtocol?
    
    lazy var pickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .clear
        if #available(iOS 14.0, *) {
            picker.preferredDatePickerStyle = style
        }
        picker.datePickerMode = type
        picker.tintColor = .mainColor
        return picker
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ok".localize, for: .normal)
        button.setTitleColor(.mainColor, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.addTarget(action: {[weak self] in
            guard let self = self else { return }
            if self.type == .date {
                self.delegate?.selected(date: self.getDateToStringDate())
            } else if self.type == .dateAndTime {
                self.delegate?.selected(date: self.getDateAndTimeToString())
            } else {
                self.delegate?.selected(date: self.getDateToStringTime())
            }
            self.dismissMePlease()
        })
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel".localize, for: .normal)
        button.setTitleColor(.mainGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white

        button.addTarget(action: {[weak self] in
            guard let self = self else { return }
            self.dismissMePlease()
        })
        return button
    }()
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainWhite
        let year = Calendar.current.component(.year, from: Date())
        label.text = "\(year)"
//        label.setFontName(arabicName: "Montserrat-Medium", englishName: "Montserrat-Medium", size: 16)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainWhite

        let monthInt = Calendar.current.component(.month, from: Date()) // 4
        let monthStr = Calendar.current.shortMonthSymbols[monthInt-1] // April

        let weakDayInt = Calendar.current.component(.weekday, from: Date()) // 4
        let weakDayStr = Calendar.current.shortWeekdaySymbols[weakDayInt - 1]

        let dayInt = Calendar.current.component(.day, from: Date()) // 4

        var text = "\(weakDayStr), " + "\(monthStr) " + "\(dayInt)"
        label.text = "\(text)"

//        label.text = "Tue, nov 29"
//        label.setFontName(arabicName: "Montserrat-Bold", englishName: "Montserrat-Bold", size: 32)
        return label
    }()
    
    private var type: UIDatePicker.Mode
    private var style : UIDatePickerStyle
    private var canSelectPreviousDate: Bool

    init(type: UIDatePicker.Mode,style: UIDatePickerStyle = .inline ,delegate: SendSelectedDateProtocol?, canSelectPreviousDate: Bool) {
        self.delegate = delegate
        self.type = type
        self.style = style
        self.canSelectPreviousDate = canSelectPreviousDate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.backgroundColor = .black.withAlphaComponent(0.6)
        if !canSelectPreviousDate{
            pickerView.minimumDate = Date()
        }
        
        if #available(iOS 14.0, *) {
            
        } else {
            view.isUserInteractionEnabled = true
        }
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.viewCornerRadius = 10
        containerView.backgroundColor = .mainColor
        containerView.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        
        view.addSubview(containerView)
        containerView.centerYInSuperview()
        containerView.centerXInSuperview()
        containerView.widthAnchorWithMultiplier(multiplier: 0.9)
        containerView.heightAnchorConstant(constant: 488)
        containerView.clipsToBounds = true
        containerView.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.topAnchorSuperView(constant: 105),
//            bottomView.heightAnchorConstant(constant: 105),
            bottomView.widthAnchorWithMultiplier(multiplier: 1),
            bottomView.centerXInSuperview(),
            bottomView.bottomAnchorSuperView(constant: 0)
            ])
        
        var stackButton = UIStackView()
        stackButton.alignment = .center
        stackButton = UIStackView(arrangedSubviews: [cancelButton,confirmButton])
        stackButton.spacing = 30
        stackButton.axis = .horizontal
        bottomView.addSubview(stackButton)
        NSLayoutConstraint.activate([
            stackButton.heightAnchor.constraint(equalToConstant: 30),
            stackButton.trailingAnchorSuperView(constant: 20),
            stackButton.bottomAnchorSuperView(constant: 10)
            ])
        bottomView.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.topAnchorSuperView(constant: 0),
            pickerView.widthAnchorWithMultiplier(multiplier: 0.9),
            pickerView.centerXInSuperview(),
            pickerView.bottomAnchor.constraint(equalTo: stackButton.topAnchor, constant: -20)
            ])
        
        var stackLabels = UIStackView()
        stackLabels.alignment = .leading
        stackLabels = UIStackView(arrangedSubviews: [yearLabel,dateLabel])
        stackLabels.spacing = 8
        stackLabels.axis = .vertical
        containerView.addSubview(stackLabels)
        
        NSLayoutConstraint.activate([
            stackLabels.topAnchorSuperView(constant: 16),
            stackLabels.leadingAnchorSuperView(constant: 24),
            pickerView.centerXInSuperview(),
            ])
        
    }
    
    func getDateToStringDate() -> String {
        let formatter = DateFormatter()
        // formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a" // date + time
        formatter.dateFormat = "yyyy-MM-dd"
        let myStringafd = formatter.string(from: pickerView.date)
        return myStringafd
    }
    
    func getDateToStringTime() -> String {
        let formatter = DateFormatter()
//        formatter.dateFormat = "h:mm a"
        formatter.dateFormat = "hh:mm:ss"

        let myStringafd = formatter.string(from: pickerView.date)
        return myStringafd
    }
    
    func getDateAndTimeToString() -> String {
        let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a" // date + time
        let myStringafd = formatter.string(from: pickerView.date)
        return myStringafd
    }
}

class DateConverter {
    static func convertToDate(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let reuslt = dateFormatter.date(from: string) ?? nil
        return reuslt
    }
    
    static func convertToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "E, d MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func getDayName(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}


class CustomDatePickerViewController: UIViewController {
    
    private weak var delegate: SendSelectedDateProtocol?
    
    lazy var pickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .clear
        if #available(iOS 14.0, *) {
            picker.preferredDatePickerStyle = .wheels
        }
        picker.viewBorderWidth = 0.5
        picker.viewBorderColor = .lightGray
        picker.viewCornerRadius = 8
        picker.datePickerMode = type
        return picker
    }()
    lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ok".localize, for: .normal)
        button.setTitleColor(.mainGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.addTarget(action: {[weak self] in
            guard let self = self else { return }
            if self.type == .date {
                self.delegate?.selected(date: self.getDateToStringDate())
            } else if self.type == .dateAndTime {
                self.delegate?.selected(date: self.getDateAndTimeToString())
            } else {
                self.delegate?.selected(date: self.getDateToStringTime())
            }
            self.dismissMePlease()
        })
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel".localize, for: .normal)
        button.setTitleColor(.mainGray, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white

        button.addTarget(action: {[weak self] in
            guard let self = self else { return }
            self.dismissMePlease()
        })
        return button
    }()
    private var type: UIDatePicker.Mode
    private var pickerStyle: UIDatePickerStyle
    init(type: UIDatePicker.Mode, style: UIDatePickerStyle, delegate: SendSelectedDateProtocol?) {
        self.delegate = delegate
        self.type = type
        self.pickerStyle = style
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        if #available(iOS 14.0, *) {
            
        } else {
//            let dismissGeasture = UITapGestureRecognizer(target: self, action: #selector(dismissMePlease))
            view.isUserInteractionEnabled = true
//            view.addGestureRecognizer(dismissGeasture)
        }
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.viewBorderWidth = 0.5
        containerView.viewBorderColor = #colorLiteral(red: 0.89402318, green: 0.8941735625, blue: 0.89400208, alpha: 1)
        containerView.viewCornerRadius = 15
        containerView.backgroundColor = .white
        containerView.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        
        view.addSubview(containerView)
        containerView.centerYInSuperview()
        containerView.centerXInSuperview()
        containerView.widthAnchorConstant(constant: 350)
        containerView.heightAnchorConstant(constant: 450)
        
        var stackButton = UIStackView()
        stackButton.alignment = .center
        stackButton = UIStackView(arrangedSubviews: [confirmButton,cancelButton])
        stackButton.spacing = 5
        stackButton.axis = .horizontal
        containerView.addSubview(stackButton)
        NSLayoutConstraint.activate([
            stackButton.widthAnchorWithMultiplier(multiplier: 0.2),
            stackButton.heightAnchor.constraint(equalToConstant: 30),
            stackButton.centerYInSuperview(),
            stackButton.bottomAnchorSuperView(constant: 10)
            ])
        
        containerView.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.widthAnchorWithMultiplier(multiplier: 0.95),
            pickerView.centerXInSuperview(),
            pickerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            pickerView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -20)
            ])
    }
    
    func getDateToStringDate() -> String {
        let formatter = DateFormatter()
        // formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a" // date + time
        formatter.dateFormat = "yyyy-MM-dd"
        let myStringafd = formatter.string(from: pickerView.date)
        return myStringafd
    }
    
    func getDateToStringTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let myStringafd = formatter.string(from: pickerView.date)
        return myStringafd
    }
    
    func getDateAndTimeToString() -> String {
        let formatter = DateFormatter()
         formatter.dateFormat = "yyyy-MM-dd hh:mm:ss a" // date + time
        let myStringafd = formatter.string(from: pickerView.date)
        return myStringafd
    }
}
