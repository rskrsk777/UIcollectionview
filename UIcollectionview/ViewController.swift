//
//  ViewController.swift
//  UIcollectionview
//
//  Created by ryosuke kubo on 2019/01/09.
//  Copyright © 2019 ryosuke kubo. All rights reserved.
//

import UIKit

let screenWid = UIScreen.main.bounds.width
let screenHei = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var collectionViewLayout: UICollectionViewFlowLayout!
    fileprivate let fruits: [String] = ["apple", "grape", "lemon", "banana", "cherry", "strobery", "peach", "orange"]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(fruits[indexPath.item])
        let NVC = NextViewController(value: fruits[indexPath.item])
        self.present(NVC, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWid / 2.0, height: screenWid / 2.0))
        label.text = fruits[indexPath.item]
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 3.0
        cell.contentView.addSubview(label)
        print("cell size \(cell.frame)")
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: screenWid / 2.0, height: screenWid / 2.0)
        print("size \(size)")
        return size
    }
}


