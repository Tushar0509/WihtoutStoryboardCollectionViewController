//
//  InstagramCollectionViewCell.swift
//  SubmissionWednesday120820
//
//  Created by Tushar Elangovan on 8/12/20.
//  Copyright © 2020 Tushar Elangovan. All rights reserved.
//

import UIKit

class InstagramCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
private let cidd = "cellID"
    
    lazy var titleheading: UILabel = {
    let title = UILabel()
        title.text = "Recent Instagram Posts"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = .red
        return title
    }()
    
    lazy var instagramcollectionview: UICollectionView = {
     let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(InstagramCell.self, forCellWithReuseIdentifier: cidd)
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cidd, for: indexPath) as! InstagramCell
        //Converting URL to image in imageview
        //Example URL
        let url = URL(string: "https://scontent-maa2-2.cdninstagram.com/v/t51.2885-15/e35/81220712_445064446401295_4233699975922577731_n.jpg?_nc_ht=scontent-maa2-2.cdninstagram.com&_nc_cat=107&_nc_ohc=aTDvwoFqEOwAX_n3XNY&oh=16346a3a3e850f21b1d9a6434cb9ff9f&oe=5F2FE622")

                           DispatchQueue.global().async {
                               do{
                               let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                                   DispatchQueue.main.async {
                                    cell.image.image = UIImage(data: data!)
                                   }
                               }
                           }
                
        cell.likescounter.text = "100 likes"
        //Example no of likes
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
        titleheading.HelpanchorWithConstants(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
//        titleheading.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        titleheading.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
//        titleheading.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    
        addSubview(instagramcollectionview)
        instagramcollectionview.topAnchor.constraint(equalTo: titleheading.bottomAnchor).isActive = true
        instagramcollectionview.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        instagramcollectionview.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        instagramcollectionview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
    }
    
}
