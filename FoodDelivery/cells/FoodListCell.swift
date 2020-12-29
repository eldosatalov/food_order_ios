import UIKit

class FoodCell: UITableViewCell {
        
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitleView: UILabel!
    
    @IBOutlet weak var price: UILabel!
    func setFood(food: Food){
        let url = URL(string: food.image)
        foodImageView.downloadImage(from: url!)
        foodTitleView.text = food.name
        price.text = String(food.default_price ?? 0)
    }

}



