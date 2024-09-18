//
//  CategoryCell.swift
//  Talabaty
//
//  Created by Mohamed Elbana on 07/05/2024.
//

import UIKit
import TalabatyCore
import Kingfisher

protocol ProductDelegate {
    func didProductQuantityUpdated(_ product: Product, _ quantity: Int)
}

class ProductCell: UICollectionViewCell {
    
    // MARK: - Common (iPhone, iPad)
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: -  iPhone
    @IBOutlet private weak var discountView: UIView?
    @IBOutlet private weak var discountLabel: UILabel?
    @IBOutlet private weak var favImageView: UIImageView?
    @IBOutlet private weak var descLabel: UILabel?
    @IBOutlet private weak var quantityStackView: UIStackView?
    @IBOutlet private weak var addToCartButton: UIButton?
    @IBOutlet private weak var quantityLabel: UILabel?
    @IBOutlet private weak var plusButton: UIButton?
    @IBOutlet private weak var minusButton: UIButton?
    
    // MARK: -  iPad
    
    private var product: Product?
    private var delegate: ProductDelegate?
    private var quantity: Int = 0
    
    static var cellId: String {
        UIDevice().isIPad ? "ProductCell_iPad" : "ProductCell_iPhone"
    }
    
    static var nib: UINib {
        return .init(nibName: cellId, bundle: .init(for: Self.self))
    }

    func configure(with product: Product, delegate: ProductDelegate?) {
        self.product = product
        self.delegate = delegate
        
        if let url = product.imageUrl {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = nil
        }
        
        titleLabel.text = product.name
        descLabel?.text = product.desc
        
        if let priceAfterDiscount = product.priceAfterDiscount,
           priceAfterDiscount > 0 {
            priceLabel.text = "$\(priceAfterDiscount)"
            discountView?.isHidden = false
            discountLabel?.text = "-$\((product.price ?? 0) - priceAfterDiscount)"
        } else {
            priceLabel.text = "$\((product.price ?? 0))"
            discountView?.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func actionAddToCart(_ sender: Any) {
        quantity += 1
        addToCartButton?.isHidden = true
        quantityStackView?.isHidden = false
        quantityLabel?.text = "\(quantity)"
        guard let product else { return }
        delegate?.didProductQuantityUpdated(product, quantity)
    }
    
    @IBAction func actionMinus(_ sender: Any) {
        quantity -= 1
        quantityLabel?.text = "\(quantity)"
        if quantity == 0 {
            addToCartButton?.isHidden = false
            quantityStackView?.isHidden = true
        }
        guard let product else { return }
        delegate?.didProductQuantityUpdated(product, quantity)
    }
    
    @IBAction func actionPlus(_ sender: Any) {
        guard let product else { return }
        if quantity == product.inventory {
            InfoBanner.shared.showError(
                title: "Max quantity",
                with: "This is max quantity can added to cart."
            )
            return
        }
        quantity += 1
        quantityLabel?.text = "\(quantity)"
        delegate?.didProductQuantityUpdated(product, quantity)
    }
}
