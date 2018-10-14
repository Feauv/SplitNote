//
//  notesHeaderView.swift
//  SplitNote
//
//  Created by Nick J Grove on 10/13/18.
//  Copyright © 2018 teamSplitNote. All rights reserved.
//

import UIKit

class NotesHeaderView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    let cellId = "cellId"
    let barHeadings = ["Title", "Duration", "Date"]
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! FoldersHeaderViewCell
        
        cell.headerLabel.text = barHeadings[indexPath.row]
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/3, height: frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NotesHeaderViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        
    }
    
    var SplitNoteDarkPurple = UIColor(displayP3Red: 66/255, green: 39/255, blue: 90/255, alpha: 1.0)
    var SplitNoteLightPurple = UIColor(displayP3Red: 115/255, green: 75/255, blue: 109/255, alpha: 1.0)
    
    private lazy var gradient: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [SplitNoteLightPurple.cgColor,SplitNoteDarkPurple.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = self.bounds
        return gradientLayer
        
    }()
    
    let headerLabel: UILabel = {
        
        let hL = UILabel()
        hL.font = UIFont(name: "Helvetica", size: 15)
        hL.textColor = .white
        hL.textAlignment = NSTextAlignment.center
        return hL
        
    }()
    
    override var isSelected: Bool {
        didSet {
            
            if isSelected {
                gradient.removeFromSuperlayer()
                backgroundColor = UIColor.white
                headerLabel.textColor = SplitNoteDarkPurple
                let border = CALayer()
                border.frame = CGRect(x: 0, y: self.frame.height - 1.0, width: self.frame.width, height: 1.0)
                self.layer.insertSublayer(border, at: 0)
            } else {
                layer.insertSublayer(gradient, at: 0)
                headerLabel.textColor = .white
            }
            
        }
    }
    
    func setupViews() {
        
        addSubview(headerLabel)
        addConstraintsWithFormat(format: "H:[v0(80)]", views: headerLabel)
        addConstraintsWithFormat(format: "V:[v0(20)]", views: headerLabel)
        
        layer.insertSublayer(gradient, at: 0)
        
        addConstraint(NSLayoutConstraint(item: headerLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: headerLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
