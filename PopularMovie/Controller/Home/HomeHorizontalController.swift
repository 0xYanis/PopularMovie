//
//  HomeHorizontalController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 10.02.2023.
//

import UIKit

class HomeHorizontalController: BaseController {
    
    private let cellId = "cellId"
    
    var tvGroup: TVGroup?
    var didSelectHandler: ((ItemTV)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        tvGroup?.items.count ?? 0
    }
    
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath
        ) as! HomeRowCell
        let tvResult = tvGroup?.items[indexPath.item]
        let nonOptionalYear = tvResult?.year ?? 1337
        
        cell.imageView.loadImage(urlString: tvResult?.posterUrlPreview ?? "")
        cell.nameLabel.text = tvResult?.nameRu ?? tvResult?.nameOriginal
        cell.dateLabel.text = String(describing: nonOptionalYear)
        
        return cell
    }
    
    
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        if let film = tvGroup?.items[indexPath.item] {
            didSelectHandler?(film)
        }
    }
}

private extension HomeHorizontalController {
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor(named: "background")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.register(HomeRowCell.self, forCellWithReuseIdentifier: cellId)
    }
}

//MARK: - DelegateFlowLayout protocol
extension HomeHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        .init(width: view.frame.width - 260, height: view.frame.height - 8)
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        15
    }
}
