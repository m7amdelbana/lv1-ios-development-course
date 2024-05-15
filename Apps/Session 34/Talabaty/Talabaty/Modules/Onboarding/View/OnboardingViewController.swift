//
//  OnboardingViewController.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 15/05/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private let viewModel: OnboardingViewModel
    
    init() {
        viewModel = OnboardingViewModel()
        super.init(nibName: .init(describing: Self.self),
                   bundle: .init(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults().set(key: .isUserShowOnboading, value: true)
        setupUI()
    }
    
    private func setupUI() {
        pageControl.numberOfPages = viewModel.list.count
        collectionView.registerCellNib(OnboardingCell.self,
                                       bundle: .init(for: Self.self))
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func actionSkip(_ sender: Any) {
        navigateToIntro()
    }
    
    @IBAction func actionNext(_ sender: Any) {
        if pageControl.currentPage == (viewModel.list.count - 1) {
            navigateToIntro()
        } else {
            let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
            collectionView.scrollToItem(at: indexPath,
                                        at: .centeredHorizontally,
                                        animated: true)
        }
    }
    
    private func navigateToIntro() {
        let vc = IntroViewController()
        let nav = UINavigationController(rootViewController: vc)
        RootRouter.presentRootScreen(with: nav)
    }
}

extension OnboardingViewController: UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(OnboardingCell.self, indexPath: indexPath)
        cell.configure(with: viewModel.list[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = self.collectionView.bounds.size
        return itemSize
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let center = width / 2
        let currentPage = Int(offset + center) / Int(width)
        
        print("Offset: \(offset)")
        print("Width: \(width)")
        print("Center: \(center)")
        print("Current page: \(currentPage)")
        
        pageControl.currentPage = currentPage
        
        if currentPage == (viewModel.list.count - 1) {
            nextButton.setTitle("Onboarding.get_started".localized,
                                for: .normal)
        } else {
            nextButton.setTitle("Onboarding.next".localized,
                                for: .normal)
        }
    }
}
