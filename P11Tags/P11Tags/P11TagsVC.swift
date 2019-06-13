//
//  P11TagsVC.swift
//  P11Tags
//
//  Created by Alvin Joseph Valdez on 13/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit

public final class P11TagsVC: UIViewController {
    
    // MARK: - Initializer
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle Methods
    public override func loadView() {
        super.loadView()
        
        self.view = P11TagsView()
        
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView.collectionView.register(
            TagCell.self,
            forCellWithReuseIdentifier: TagCell.identifier
        )
        
        self.rootView.collectionView.dataSource = self
        self.rootView.collectionView.delegate = self
        
        self.tags = [
            Tag(name: "textile"), Tag(name: "manufacturing"),
            Tag(name: "software"), Tag(name: "human resources"),
            Tag(name: "heavy equipments"), Tag(name: "agriculture"),
            Tag(name: "aviation"), Tag(name: "heavy equipments"),
            Tag(name: "agriculture"), Tag(name: "education"),
            Tag(name: "aviation"), Tag(name: "motors"),
            Tag(name: "motors"),Tag(name: "textile"), Tag(name: "manufacturing"),
            Tag(name: "software"), Tag(name: "human resources"),
            Tag(name: "heavy equipments"), Tag(name: "agriculture"),
            Tag(name: "aviation"), Tag(name: "heavy equipments"),
            Tag(name: "agriculture"), Tag(name: "education"),
            Tag(name: "aviation"), Tag(name: "motors"),
            Tag(name: "motors")
        ]
    }
    
    // MARK: - Stored Properties
    public var tags: [Tag] = [Tag]()
}

// MARK: - Views
extension P11TagsVC {
    public var rootView: P11TagsView { return self.view as! P11TagsView }
}

// MARK: - UICollectionViewDataSource Methods
extension P11TagsVC: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TagCell.identifier,
                for: indexPath
            ) as? TagCell
        else { return UICollectionViewCell() }
        
        let tag: Tag = self.tags[indexPath.item]
        
        cell.configure(model: tag)
        
        return cell
    }
}

extension P11TagsVC: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tagName: String = self.tags[indexPath.item].name
        
        let tagWidth: CGFloat = tagName.width(
            withConstrainedHeight: 60.0,
            font: UIFont.systemFont(ofSize: 13.0, weight: UIFont.Weight.regular)
        )
        
        return self.rootView.collectionView.systemLayoutSizeFitting(
            CGSize(width: tagWidth + 20, height: 30.0)
        )
    }
}
