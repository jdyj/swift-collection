//
//  ViewController.swift
//  ttest
//
//  Created by 조재영 on 2022/03/02.
//

import UIKit

class ViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
                
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // 수정된 부분
        self.collectionView.register(DatePickerCell.self, forCellWithReuseIdentifier: ID_DATE_CELL)
        self.collectionView.register(HourPickerCell.self, forCellWithReuseIdentifier: ID_HOUR_CELL)
        self.collectionView.register(MinutePickerCell.self, forCellWithReuseIdentifier: ID_MIN_CELL)
        
        self.collectionView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        
        let constraints = [
            collectionView.heightAnchor.constraint(equalToConstant: 180),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3)
       }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    let ID_DATE_CELL = "DatePickerCell"
    let ID_HOUR_CELL = "HourPickerCell"
    let ID_MIN_CELL = "MinutePickerCell"
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            var cell = UICollectionViewCell()
            
            if indexPath.section == 0 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID_DATE_CELL, for: indexPath) as! DatePickerCell
            } else if indexPath.section == 1 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID_HOUR_CELL, for: indexPath) as! HourPickerCell
            } else {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID_MIN_CELL, for: indexPath) as! MinutePickerCell
            }
            
            return cell
        }
    
}

