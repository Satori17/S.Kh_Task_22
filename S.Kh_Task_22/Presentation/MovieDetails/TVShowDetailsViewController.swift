//
//  MovieDetailsViewController.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import UIKit
import Cosmos

class TVShowDetailsViewController: UIViewController {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var tvShowImageView: UIImageView! {
        didSet {
            tvShowImageView.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var tvShowNameLabel: UILabel!
    @IBOutlet weak var tvShowRatingLabel: UILabel!
    @IBOutlet weak var tvShowPopularityLabel: UILabel!
    @IBOutlet weak var tvShowOriginalLanguageLabel: UILabel!
    @IBOutlet weak var tvShowOverviewLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    
    //MARK: - Vars
    static let identifier = "TVShowDetailsViewController"
    var tvShow: TVShowModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tvShow = tvShow {
            setupTVShow(With: tvShow)
        }
        setupRatingView()
    }
    
    private func setupTVShow(With tvShow: TVShowModel) {
        Fetcher.shared.fetchImage(with: tvShow.posterPath, imageView: tvShowImageView)
        if let rating = tvShow.voteAverage, let popularity = tvShow.popularity {
            tvShowNameLabel.text = tvShow.name
            tvShowRatingLabel.text = "\(rating)⭐️"
            ratingView.rating = getCorrectRatingStars(withRating: rating)
            tvShowPopularityLabel.text = "\(popularity)"
            tvShowOriginalLanguageLabel.text = tvShow.originalLanguage?.uppercased()
            tvShowOverviewLabel.text = tvShow.overview
        }
    }
    
    private func setupRatingView() {
        ratingView.didFinishTouchingCosmos = { ratingState in
            RatingResponseUrlBuilder.tvShowId = self.tvShow?.id
            RatingResponseUrlBuilder.rating = ratingState
            Fetcher.shared.fetchData(with: RatingResponseUrlBuilder.shared, as: RatingResponse.self) { response in
                guard let message = response.statusMessage else { return }
                self.rateSuccessAlert(withMessage: message)
            } fail: { message in
                print(message)
            }
        }
    }
    
    private func getCorrectRatingStars(withRating rating: Double) -> Double {
        switch rating {
        case 1..<3:
            return 1
        case 3..<5:
            return 2
        case 5..<7:
            return 3
        case 7..<9:
            return 4
        case 9...10:
            return 5
        default:
            return 0
        }
    }
    
    private func rateSuccessAlert(withMessage message: String) {
        let alert = UIAlertController(title: "Thank you!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }
    
}
