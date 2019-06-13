//
//  MainView.swift
//  P11Tags
//
//  Created by Alvin Joseph Valdez on 13/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public class MainView: UIView {
    
    // MARK: - Initializer
    public init(tagsView: P11TagsView) {
        self.tagsView = tagsView
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        
        
        self.subviews(forAutoLayout: [
            self.tagsView
        ])
        
        self.tagsView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            self.collectionViewHeightConstraint = make.height.equalTo(200.0).constraint
            make.leading.equalToSuperview().offset(50.0)
            make.trailing.equalToSuperview().inset(50.0)
            make.centerY.equalToSuperview()
        }            
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Stored Properties
    public unowned var tagsView: P11TagsView
    public var collectionViewHeightConstraint: Constraint!
}

// MARK: - Helper Methods
extension MainView {
    
    public func updateCollectionView(height: CGFloat) {
        
        self.collectionViewHeightConstraint.update(offset: height)        
        self.layoutIfNeeded()
    }
}
