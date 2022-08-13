//
//  MoviesViewController+CollectionView.swift
//  S.Kh_Task_22
//
//  Created by Saba Khitaridze on 13.08.22.
//

import UIKit

extension TVShowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tvShows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVShowCell.identifier, for: indexPath) as? TVShowCell {
            let currentTVShow = tvShows[indexPath.row]
            cell.configure(currentTVShow)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let destinationVC = UIStoryboard(name: TVShowDetailsViewController.identifier, bundle: nil).instantiateViewController(withIdentifier: TVShowDetailsViewController.identifier) as? TVShowDetailsViewController {
            destinationVC.tvShow = tvShows[indexPath.row]
            
            navigationController?.pushViewController(destinationVC, animated: true)
        }
        
    }
    
    //Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       if !UIDevice.current.orientation.isLandscape {
            return CGSize(width: view.frame.size.width/3.5, height: view.frame.size.height/3.5)
        } else {
            return CGSize(width: view.frame.size.width/7, height: view.frame.size.height/1.5)
        }
    }
    
}
