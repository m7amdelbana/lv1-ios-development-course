//
//  TaskViewController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 07/11/2023.
//

import UIKit

enum ValidationError: Error {
    case emptyTitle
    case emptyDescription
    case emptyDate
    case emptyTag
}

protocol TaskViewDelegate {
    func refreshData()
}

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
    private var delegate: TaskViewDelegate? = nil
    private var selectedTag: MyTaskTag?
    
    init(myTask: MyTask? = nil, delegate: TaskViewDelegate?) {
        self.myTask = myTask
        self.delegate = delegate
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
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        let date = dateTextField.text ?? ""
        
        guard let selectedTag else { return }
        
        if let myTask {
            // Edit task

            myTask.title = title
            myTask.descriptionTitle = description
            myTask.date = date
            myTask.tag = selectedTag
            
            CoreDataManager().update(model: myTask)
            
            delegate?.refreshData()
            dismiss(animated: true)
        } else {
            // Add task
            
            do {
                try addTask(title: title,
                        desc: description,
                        date: date,
                        tag: selectedTag)
                
                delegate?.refreshData()
                dismiss(animated: true)
            } catch ValidationError.emptyTitle {
                presentError(error: "Please enter task title!")
            } catch ValidationError.emptyDescription {
                presentError(error: "Please enter task description!")
            } catch {
                presentError(error: "\(error)")
            }
            
            /*
            let newTask = MyTask(
                id: "#\(Int.random(in: 99...999))",
                // id: "#\(UUID().uuidString)",
                title: title,
                descriptionTitle: description,
                date: date,
                tag: selectedTag)
            
            CoreDataManager().save(model: newTask)
            */
        }
    }
    
    private func addTask(title: String?,
                         desc: String?,
                         date: String?,
                         tag: MyTaskTag?) throws {
        
        guard let title, !title.isEmpty else {
            throw ValidationError.emptyTitle
        }
        
        guard let desc, !desc.isEmpty else {
            throw ValidationError.emptyDescription
        }
        
        guard let date, !date.isEmpty else {
            throw ValidationError.emptyDate
        }
        
        guard let tag else {
            throw ValidationError.emptyTag
        }
        
        let newTask = MyTask(
            id: "#\(Int.random(in: 99...999))",
            title: title,
            descriptionTitle: description,
            date: date,
            tag: tag)
        
        CoreDataManager().save(model: newTask)
    }
    
    @IBAction func actionCompleteTask(_ sender: Any) {
        let alert = UIAlertController(
            title: "Complete task 🎉",
            message: "Are you sure that you completed this task?",
            preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Yes", style: .default) { _ in
            if let myTask = self.myTask {
                CoreDataManager().remove(model: myTask)
                self.delegate?.refreshData()
                self.dismiss(animated: true)
            }
        }
        
        let action2 = UIAlertAction(title: "No", style: .destructive)
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true)
    }
    
    private func presentError(error: String) {
        let alert = UIAlertController(
            title: "Validation error",
            message: error,
            preferredStyle: .actionSheet)

        let action = UIAlertAction(title: "Ok!", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
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
