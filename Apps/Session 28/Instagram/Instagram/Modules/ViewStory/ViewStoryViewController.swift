//
//  ViewStoryViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 26/01/2024.
//

import UIKit
import Kingfisher

class ViewStoryViewController: UIViewController {

    @IBOutlet weak var timerProgresView: UIProgressView!
    @IBOutlet weak var storyImageView: UIImageView!
    
    private let imageUrl: String
    private var counter = 15.0
    private let viewSeconds = 15.0
    private var timer: Timer?
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: imageUrl) {
            storyImageView.kf.setImage(with: url)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timerProgresView.setProgress(0.0, animated: true)
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(counterDown),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func counterDown() {
        counter -= 0.1
        if counter < 0 {
            timer?.invalidate()
            dismiss(animated: true)
        }
        let progress = (viewSeconds - Double(counter)) / viewSeconds
        timerProgresView.setProgress(Float(progress), animated: true)
    }
    
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
