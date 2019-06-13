//
//  TagCell.swift
//  P11Tags
//
//  Created by Alvin Joseph Valdez on 13/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class TagCell: UICollectionViewCell {
    
    public let titleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(
            ofSize: 13.0,
            weight: UIFont.Weight.bold
        )
        view.textColor = UIColor.gray
        view.textAlignment = NSTextAlignment.center
        return view
    }()
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)        
        self.backgroundColor = UIColor.white
        
        let colorPrime: UIColor = UIColor(red: 0.03, green: 0.75, blue: 0.63, alpha: 1)
        
        self.subviews(forAutoLayout: [
            self.titleLabel
        ])
        
        self.titleLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1.0
        
        self.contentView.layer.borderColor = colorPrime.cgColor
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor.white
        
        self.titleLabel.textColor = colorPrime
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public APIs
extension TagCell {
    
    public static var identifier: String = "TagCell"
    
    public func configure(model: Tag) {
        self.titleLabel.text = model.name
    }
}
