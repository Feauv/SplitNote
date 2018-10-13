//
//  foldersHeaderView.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class FoldersHeaderView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    let cellId = "cellId"
    let barHeadings = ["Title", "# of Files"]
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)

        collectionView.register(FoldersHeaderViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/2, height: frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FoldersHeaderViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        
    }
    
    let headerLabel: UILabel = {
    
        let hL = UILabel()
        hL.font = UIFont(name: "Helvetica-Light", size: 12)
        hL.textColor = .white
        hL.textAlignment = NSTextAlignment.center
        return
    
    }()
    
    func setupViews() {
        
        addSubview(headerLabel)
        addConstraintsWithFormat(format: "H:[v0(100)]", views: headerLabel)
        addConstraintsWithFormat(format: "V:[v0(20)]", views: headerLabel)
        
        layer.insertSublayer(gradient, at: 0)
        
        addConstraint(NSLayoutConstraint(item: barButtonLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: barButtonLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
