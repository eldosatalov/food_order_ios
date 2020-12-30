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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var addToCart: UIButton!
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
    @IBAction func addToCartFood(_ sender: Any) {
        let newFood = FoodCD(context: self.context)
        newFood.image = self.image
        newFood.name = self.name
        newFood.price = self.price
        try? self.context.save()
    }
    

}
