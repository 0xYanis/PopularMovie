//
//  HomeFooterController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit
import SDWebImage

final class FooterHorizontalController: HorizontalSnappingController {
    
    private let cellId = "cellId"
    
    var mostExpected: MostExpected?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        mostExpected?.films.count ?? 0
    }
    
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath
        ) as! HomeFooterCell
        let topAwait = mostExpected?.films[indexPath.item]
        let genres = topAwait?.genres.first
        
        cell.imageView.sd_setImage(with: URL(string: topAwait?.posterUrlPreview ?? ""))
        cell.nameLabel.text = topAwait?.nameRu ?? topAwait?.nameEn ?? ""
        cell.dateLabel.text = "Год выхода: " + (topAwait?.year ?? "")
        cell.ratingLabel.text = "Рейтинг: " + (topAwait?.rating ?? "")
        cell.descriptionLabel.text = "Жанр: " + (genres?.genre ?? "")
        
        return cell
    }
    
}

private extension FooterHorizontalController {
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor(named: "background")
        collectionView.register(
            HomeFooterCell.self,
            forCellWithReuseIdentifier: cellId
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(
            top: 0, left: 15,
            bottom: 0, right: 15
        )
    }
    
}

//MARK: - DelegateFlowLayout protocol
extension FooterHorizontalController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        .init(width: view.frame.width - 48, height: view.frame.height - 25)
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        .zero
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        15
    }
}
