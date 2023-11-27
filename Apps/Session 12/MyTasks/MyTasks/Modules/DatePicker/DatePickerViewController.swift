//
//  DatePickerViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 24/11/2023.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    private let didSelectDate: (Date) -> ()
    
    init(didSelectDate: @escaping (Date) -> ()) {
        self.didSelectDate = didSelectDate
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // datePicker.minimumDate = Date()
        // datePicker.maximumDate
    }
    
    @IBAction func actionConfirm(_ sender: Any) {
        didSelectDate(datePicker.date)
        dismiss(animated: true)
    }
    
    @IBAction func actionCancel(_ sender: Any) {
        dismiss(animated: true)
    }
}
