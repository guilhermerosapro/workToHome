//
//  MovieBackdropCell.swift
//  ChallengeCIEC
//
//  Created by Guilherme C Rosa on 27/07/19.
//  Copyright © 2019 Guilherme Rosa. All rights reserved.
//

import UIKit

class MovieBackdropCell: UITableViewCell {

    
    @IBOutlet weak var imageBackdrop: UIImageView!
    @IBOutlet weak var buttonBack: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
    }
    
    func setup(movie: MovieDetail?) {
        self.imageBackdrop.contentMode = .scaleAspectFit
        self.serviceImage(movie: movie)
    }
}

extension MovieBackdropCell {
    
    private func serviceImage(movie: MovieDetail?) {
        let service = TheMovieDBService()
        
        guard let m = movie else { return }
        
        service.getMovieBackdrop(movie: m) { (image, error) in
            if let err = error {
                print("deu errado error")
                print(err)
            } else {
                if let img = image {
                    self.imageBackdrop.image = img
                } else {
                    print("deu errado image")
                }
            }
        }
        
    }
}
