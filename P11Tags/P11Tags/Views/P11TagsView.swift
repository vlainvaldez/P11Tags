//
//  P11TagsView.swift
//  P11Tags
//
//  Created by Alvin Joseph Valdez on 13/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public class P11TagsView: UIView {
    
    // MARK: - Delegate Properties
    public weak var delegate: P11TagsViewDelegate?
    
    // MARK: - Subviews
    public let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 5.0
        let view: UICollectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = false
        view.isScrollEnabled = true
        view.allowsSelection = true
        return view
    }()
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.collectionView
        ])
        
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(5.0)
            make.leading.equalToSuperview().offset(5.0)
            make.trailing.equalToSuperview().inset(5.0)
            make.bottom.equalToSuperview().inset(5.0)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let collectionViewHeight: CGFloat = self.collectionView.collectionViewLayout.collectionViewContentSize.height
        
        guard let delegate = self.delegate else { return }
        
        delegate.update(height: collectionViewHeight + 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
