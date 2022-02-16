//
//  MovieCell.swift
//  AlamofireMovieExample
//
//  Created by burak ozen on 1.12.2021.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
   
    @IBOutlet weak var moviePoint: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        static let identifier = "MovieCell"
//        
//        static func nib() -> UINib {
//            return UINib(nibName: "MovieCell", bundle: nil)
//        }

        // Configure the view for the selected state
    }
    
    
}


