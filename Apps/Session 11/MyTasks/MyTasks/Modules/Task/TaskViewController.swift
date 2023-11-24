//
//  TaskViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: AppTextField!
    @IBOutlet weak var dateTextField: AppTextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var selectTagCollectionView: UICollectionView!
    @IBOutlet weak var completeTaskButton: UIButton!
    @IBOutlet weak var manageTaskButton: UIButton!
    
    var tags = [MyTaskTag]()
    private var myTask: MyTask?
    private var selectedTag: MyTaskTag?
    
    init(myTask: MyTask? = nil) {
        self.myTask = myTask
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tags = TaskFactory().tags
        
        if let myTask {
            setupEditUI(myTask: myTask)
        } else {
            setupAddUI()
        }
        
        setupCollectionView()
        dateTextField.delegate = self
    }
    
    private func setupEditUI(myTask: MyTask) {
        titleLabel.text = "Task details"
        completeTaskButton.isHidden = false
        
        manageTaskButton.setTitle("Edit task", for: .normal)
        manageTaskButton.backgroundColor = .clear
        manageTaskButton.setTitleColor(.primary, for: .normal)
        manageTaskButton.borderColor = .primary
        manageTaskButton.borderWidth = 2
        
        // Fill data
        
        titleTextField.text = myTask.title
        dateTextField.text = myTask.date
        descriptionTextView.text = myTask.descriptionTitle
        
        tags.forEach { item in
            if item.title == myTask.tag.title {
                item.isSelected = true
            }
        }
    }
    
    private func setupAddUI() {
        titleLabel.text = "Add task"
        completeTaskButton.isHidden = true
        
        manageTaskButton.setTitle("Add task", for: .normal)
        manageTaskButton.backgroundColor = .primary
        manageTaskButton.setTitleColor(.white, for: .normal)
        manageTaskButton.borderColor = .clear
        manageTaskButton.borderWidth = 0
    }
    
    @IBAction func actionManageTask(_ sender: Any) {
        if let myTask {
            // Edit task
        } else {
            // Add task
            
            let title = titleTextField.text ?? ""
            let description = descriptionTextView.text ?? ""
            let date = dateTextField.text ?? ""
            
            guard let selectedTag else { return }
            
            let newTask = MyTask(
                id: "#555",
                title: title,
                descriptionTitle: description,
                date: date,
                tag: selectedTag)
            
            CoreDataManager().save(model: newTask)
            dismiss(animated: true)
        }
    }
    
    @IBAction func actionCompleteTask(_ sender: Any) {
        
    }
}

extension TaskViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == dateTextField {
            let vc = DatePickerViewController { date in
                // "Sunady 12/11/2023 10:30 AM"
                // "12/11/2023 10:30 AM"
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy hh:mm a"
                self.dateTextField.text = formatter.string(from: date)
            }
            
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
            return false
        }
        return true
    }
}

extension TaskViewController: UICollectionViewReference,
                              UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        selectTagCollectionView.registerCellNib(TagSelectionCell.self)
        selectTagCollectionView.delegate = self
        selectTagCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(TagSelectionCell.self,
                                          indexPath: indexPath)
        cell.configure(with: tags[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = tags[indexPath.item]
        
        tags
            .filter { $0.isSelected && $0.title != model.title }
            .forEach { i in i.isSelected = false }
        
        model.isSelected.toggle()
        
        if model.isSelected {
            selectedTag = model
        } else {
            selectedTag = nil
        }
        
        //        tags.forEach { item in
        //            if item.title == model.title {
        //                item.isSelected.toggle()
        //            } else {
        //                item.isSelected = false
        //            }
        //        }
        
        //        if model.isSelected == false {
        //            tags.forEach { item in item.isSelected = false }
        //            model.isSelected = true
        //        } else {
        //            model.isSelected = false
        //        }
        
        selectTagCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 40)
    }
}
