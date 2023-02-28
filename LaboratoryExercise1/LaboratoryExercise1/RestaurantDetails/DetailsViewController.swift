//
//  DetailsViewController.swift
//  LaboratoryExercise1
//
//  Created by student on 2/27/23.
//

import UIKit

class DetailsViewController: UIViewController {

    var restaurant: Restaurant?
//    @IBOutlet weak var Label: UILabel!
//    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label?.text = restaurant?.name ?? "No Restaurant Name"
        imageView?.image = UIImage(named: restaurant?.imageName ?? "No Restaurant Image")
    }
}
