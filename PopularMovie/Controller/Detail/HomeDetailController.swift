//
//  HomeDetailController.swift
//  PopularMovie
//
//  Created by Yan Rybkin on 11.02.2023.
//

import UIKit
import CoreData

class HomeDetailController: BaseController {
    
    private let posterId = "posterId"
    private let controlId = "controlId"
    private let labelId = "labelId"
    
    private let filmId: Int
    private var popularMovies: DetailMovie?
    private var timer: Timer?
    var favoriteFilm: [NSManagedObject] = []
    
    private lazy var kinopoiskUrl = "https://www.kinopoisk.ru/film/\(self.filmId)/"
    private lazy var activityItems = ["Советую посмотреть", kinopoiskUrl]
    
    init(filmId: Int) {
        self.filmId = filmId
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTabBarHidden(true)
        hideTabbar(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setTabBarHidden(false)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        3
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: posterId,
                for: indexPath) as! DetailPosterCell
            cell.movie = popularMovies
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: controlId,
                for: indexPath) as! DetailControlCell
            configureControlCell(cell)
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: labelId,
                for: indexPath) as! DetailLabelCell
            cell.movie = popularMovies
            return cell
        }
    }
    
    func configureControlCell(_ cell: DetailControlCell) {
        cell.likeButton.tintColor = checkFavorite ? .yellow : .white
        cell.likeButton.setImage(UIImage(
            systemName: checkFavorite ? "star.fill" : "star"),
                                 for: .normal
        )
        cell.shareButton.addTarget(
            self,
            action: #selector(shareTapped),
            for: .touchUpInside
        )
        cell.linkButton.addTarget(
            self,
            action: #selector(linkTapped),
            for: .touchUpInside
        )
        cell.likeButton.addTarget(
            self,
            action: #selector(likeTapped),
            for: .touchUpInside
        )
    }
}

private extension HomeDetailController {
    
    func setupCollectionView() {
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.backgroundColor = .black
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(
            DetailPosterCell.self,
            forCellWithReuseIdentifier: posterId
        )
        collectionView.register(
            DetailControlCell.self,
            forCellWithReuseIdentifier: controlId
        )
        collectionView.register(
            DetailLabelCell.self,
            forCellWithReuseIdentifier: labelId
        )
    }
    
    func hideTabbar(_ hidden: Bool) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.3,
            repeats: false,
            block: { _ in
                self.tabBarController?.tabBar.isHidden = hidden
            })
    }
    
    func fetchData() {
        let urlString = "https://kinopoiskapiunofficial.tech/api/v2.2/films/\(self.filmId)"
        Service.shared.fetchGenericJSONData(urlString) { (result: DetailMovie?, err) in
            let movie = result
            self.popularMovies = movie
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc func shareTapped() {
        let activityVC = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil
        )
        present(activityVC, animated: true, completion: nil)
    }
    
    @objc func linkTapped() {
        guard let url = URL(string: kinopoiskUrl) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func likeTapped() {
        guard let film = popularMovies else { return }
        
        let dataStoreManager = DataStoreManager.shared
        
        if !checkFavorite {
            let favorite = dataStoreManager.saveFilm(
                image: film.posterUrlPreview,
                isFavorite: true,
                title: film.nameRu ?? "",
                year: Int16(film.year)
            )
            if let favorite = favorite {
                favoriteFilm.append(favorite)
                collectionView.reloadData()
            }
        } else {
            let arrRemovedObjects = dataStoreManager.deleteFilm(
                key: "title",
                value: film.nameRu ?? ""
            )
            favoriteFilm = favoriteFilm.filter { param in
                !(arrRemovedObjects?.contains(param as! Favorite) ?? false)
            }
            collectionView.reloadData()
        }
    }
    
    var checkFavorite: Bool {
        return DataStoreManager.shared.isFavoriteFilm(
            title: popularMovies?.nameRu ?? ""
        )
    }
    
}

extension HomeDetailController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        if indexPath.item == 0 {
            return .init(width: view.frame.width, height: 370)
        } else if indexPath.item == 1 {
            return .init(width: view.frame.width, height: 70)
        } else {
            return .init(width: view.frame.width, height: 500)
        }
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        .zero
    }
    
}
