//
//  SplashViewController.swift
//  Instagram
//
//  Created by Mohamed Elbana on 04/12/2023.
//

import UIKit
import FirebaseAuth
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    // @IBOutlet weak var logoBottomConstraint: NSLayoutConstraint!
    
    private var animationView: LottieAnimationView?
    
    init() {
        super.init(nibName: String(describing: Self.self),
                   bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // loadAnimationView()
    }
    
    private func loadAnimationView() {
        // 2. Start LottieAnimationView with animation name (without extension)
        animationView = .init(name: "check")
        guard let animationView else { return }
        animationView.frame = boxView.bounds
        
        // 3. Set animation content mode
        
        animationView.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        animationView.loopMode = .loop
        
        // 5. Adjust animation speed
        
        animationView.animationSpeed = 0.5
        
        boxView.addSubview(animationView)
        
        // 6. Play animation
        
        animationView.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if Auth.auth().currentUser != nil {
                self.presentHome()
            } else {
                self.presentSignIn()
            }
        }
        
        /*
        let screenHeight = UIScreen.main.bounds.height
        let logoHeight = logoImageView.bounds.height
        self.logoBottomConstraint.constant = -200.0
        // logoImageView.alpha = 0
        
        UIView.animate(withDuration: 5, delay: 1) {
            // self.logoImageView.alpha = 1.0
            self.logoBottomConstraint.constant = (screenHeight / 2.0) - (logoHeight / 2.0)
            self.view.layoutIfNeeded()
            // self.viewDidLayoutSubviews()
        }
        */
        
        /*
        UIView.animate(withDuration: 5, delay: 1) {
            self.boxView.backgroundColor = .systemRed
            self.boxView.bounds.size.width -= 100
            self.boxView.bounds.size.height -= 100
            self.boxView.cornerRadius = 100.0
        }
        */
        
        /*
        UIView.animate(withDuration: 5, delay: 1, options: [.autoreverse, .repeat], animations: {
            self.boxView.backgroundColor = .systemRed
            self.boxView.bounds.size.width -= 100
            self.boxView.bounds.size.height -= 100
            self.boxView.cornerRadius = 100.0
        }) { _ in
            // Once animation done
            
        }
        */
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // We use them function if need to update constraint
    }
    
    private func presentSignIn() {
        let vc = SignInViewController()
        let nav = AppNavController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
    
    private func presentHome() {
        let tabBar = AppTabBarController()
        RootRouter.presentRootScreen(with: tabBar)
    }
}
