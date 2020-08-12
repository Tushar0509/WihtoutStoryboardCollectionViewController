//
//  YotutubeCollectionViewCell.swift
//  SubmissionWednesday120820
//
//  Created by Tushar Elangovan on 8/12/20.
//  Copyright © 2020 Tushar Elangovan. All rights reserved.
//

import UIKit

class YotutubeCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    let cidd = "cellID"
     lazy var titleheading: UILabel = {
       let title = UILabel()
           title.text = "Recent Youtube Videos"
           title.font = UIFont.boldSystemFont(ofSize: 20)
           title.textColor = .red
           return title
       }()
       
       lazy var youtubecollectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.delegate = self
           cv.dataSource = self
           cv.register(YoutubeCell.self, forCellWithReuseIdentifier: cidd)
           return cv
       }()
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 4
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cidd, for: indexPath) as! YoutubeCell
           cell.image.image = UIImage(named: "")
           cell.likescounter.text = "100 likes"
           return cell
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
           
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: frame.height - 40)
       }
       
       override init(frame: CGRect) {
           super .init(frame: frame)
           setuplayout()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       fileprivate func setuplayout(){
           addSubview(titleheading)
           titleheading.topAnchor.constraint(equalTo: topAnchor).isActive = true
           titleheading.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
           titleheading.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
           addSubview(youtubecollectionview)
           youtubecollectionview.topAnchor.constraint(equalTo: titleheading.bottomAnchor).isActive = true
           youtubecollectionview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
           youtubecollectionview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
           youtubecollectionview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
       }
    
    
    
}
