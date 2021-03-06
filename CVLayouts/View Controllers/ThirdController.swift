//
//  ViewController.swift
//  CVLayouts
//
//  Created by Telem Tobi on 15/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import UIKit

class ThirdController: UIViewController {

    var collectionView: UICollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        setCollectionView()
    }

    func setUpElements() {
        view.backgroundColor = .white
        setBackgroundImage(UIImage(named: "wallpaper")!)
    }

    func setCollectionView() {
        let layout = ThirdLayout.shared.create()
        collectionView = prepareCollectionView(layout: layout)
        
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.id)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: SectionHeader.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ThirdController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.id, for: indexPath) as! NumberCell
        cell.numberLabel.text = (indexPath.item + 1).description
        if indexPath.section % 2 == 1 && (indexPath.item + 1) % 3 == 0 || indexPath.section % 2 == 0 && indexPath.item % 3 == 0 {
            cell.contentView.backgroundColor = .systemPink
        } else {
            cell.contentView.backgroundColor = .systemBlue
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: SectionHeader.id, for: indexPath) as! SectionHeader
        header.titleLabel.text = "Section Header # \(indexPath.section + 1)"
        return header
    }
}

