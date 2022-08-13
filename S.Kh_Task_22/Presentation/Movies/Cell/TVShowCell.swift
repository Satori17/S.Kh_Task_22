//
//  TVShowCell.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import UIKit

class TVShowCell: UICollectionViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var tvShowImageView: UIImageView!
    @IBOutlet weak var tvShowNameLabel: UILabel!
    
    //MARK: - Vars
    
     let identifier = "TVShowCell"
    
    //MARK: -  Cell Identifier
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
    }

    
    //MARK: - Methods
    func configure(_ show: TVShowModel) {
        Fetcher.shared.fetchImage(with: show.posterPath, imageView: tvShowImageView)
        tvShowNameLabel.text = show.name
    }
    
}
