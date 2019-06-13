//
//  ViewController.swift
//  P11Tags
//
//  Created by Alvin Joseph Valdez on 13/06/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    // MARK: - Initializer
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    public override func loadView() {
        super.loadView()
        
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// MARK: - Views
extension MainVC {
    public var rootView: MainView { return self.view as! MainView }
}

