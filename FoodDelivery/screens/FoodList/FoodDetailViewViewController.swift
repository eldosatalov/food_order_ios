//
//  FoodDetailViewViewController.swift
//  FoodDelivery
//
//  Created by Akira Watanabe on 12/12/20.
//

import UIKit

class FoodDetailViewViewController: UIViewController {
    var image: String!
    var name: String!
    var price: String!
    

    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: self.image)
        imageView.downloadImage(from: url!)
        titleView.text = self.name
        priceView.text = self.price

    }
    

}
