//
//  ViewController.swift
//  AlamofireMovieExample
//
//  Created by burak ozen on 30.11.2021.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var movieListLabel: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    var movieResponse: MovieResponse?
    var detailMovie : Result?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
        

        
        Network.getMovieData { response in
            self.movieResponse = response
            self.tblView.reloadData()
        } errorHandler: { error in
            print("error")
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResponse?.results?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//      api
        let cell = tblView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movieName.text = movieResponse?.results?[indexPath.row].originalTitle
        cell.movieYear.text = movieResponse?.results?[indexPath.row].releaseDate
        cell.moviePoint.text = "\(movieResponse?.results?[indexPath.row].voteAverage ?? 0.0)"
        
//        kingfisher
        let media = movieResponse?.results?[indexPath.row]
        let str = "https://image.tmdb.org/t/p/w500\(media?.posterPath ?? "")"
        cell.movieImage.kf.setImage(with: URL(string: str), placeholder: nil, options: nil, completionHandler: nil)
        
        return cell 
    }
    
    
//    details VC data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let vc = segue.destination as! DetailsViewController
            vc.movie = detailMovie


            } else {


        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.detailMovie = movieResponse?.results?[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: self)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 222
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Interaction
        print("cell with path: \(indexPath.row)")
    }
    
    
    
}

//}
