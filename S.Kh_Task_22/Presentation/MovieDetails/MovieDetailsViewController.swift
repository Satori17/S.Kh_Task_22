//
//  MovieDetailsViewController.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    
    //MARK: - IBOutlets
    @IBOutlet weak var tvShowImageView: UIImageView!
    @IBOutlet weak var tvShowRatingLabel: UILabel!
    @IBOutlet weak var tvShowPopularityLabel: UILabel!
    @IBOutlet weak var tvShowOriginCountryLabel: UILabel!
    @IBOutlet weak var tvShowOverviewLabel: UILabel!
    
    
    //MARK: - Vars
    static let identifier = "MovieDetailsViewController"
    var tvShow: TVShowModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tvShow = tvShow {
            setupTVShow(With: tvShow)
        }
    }
    
    private func setupTVShow(With tvShow: TVShowModel) {
        Fetcher.shared.fetchImage(with: tvShow.posterPath, imageView: tvShowImageView)
        if let rating = tvShow.voteAverage, let popularity = tvShow.popularity, let originCountry = tvShow.originCountry {
            tvShowRatingLabel.text = "\(rating)"
            tvShowPopularityLabel.text = "\(popularity)"
            tvShowOriginCountryLabel.text = "\(originCountry[0])"
            tvShowOverviewLabel.text = tvShow.overview
        }
    }

}
