//
//  DetailsViewController.swift
//  AlamofireMovieExample
//
//  Created by burak ozen on 6.01.2022.
//

import UIKit
import Alamofire
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsMovieImage: UIImageView!
    @IBOutlet weak var detailsMovieNameLabel: UILabel!
    @IBOutlet weak var detailsYear: UILabel!
    @IBOutlet weak var detailsPoint: UILabel!
    @IBOutlet weak var detailsAbout: UILabel!
    
    
    var movie : Result?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.detailsMovieNameLabel.text = movie?.originalTitle
        self.detailsYear.text = movie?.releaseDate
        self.detailsPoint.text = "\(movie?.voteAverage ?? 0.0)"
        self.detailsAbout.text = movie?.overview
        
        let str="https://image.tmdb.org/t/p/w500\(movie?.posterPath ?? "")"
        self.detailsMovieImage.kf.setImage(with: URL(string: str), placeholder: nil, options: nil, completionHandler: nil)
    }
    

    

}
