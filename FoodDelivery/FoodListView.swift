//
//  FoodListViewViewController.swift
//  FoodDelivery
//
//  Created by Akira Watanabe on 12/12/20.
//

import UIKit

class FoodListView: UITableViewController {
    
    var foods: [Food] = []
    
    @IBOutlet var foodTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        getFoods()
    }
    

    func getFoods(){
            
        guard let foodListURL = URL(string: "https://api.fooddy24.com/api/food/") else {
            return
        }
        
        let request = URLRequest(url: foodListURL)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    self.foods.removeAll()
            
                    self.foods = decodedResponse.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                  
                    return
                }
            }

        }.resume()

    }

}


extension FoodListView{
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        cell.setFood(food: food)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FoodDetailViewViewController {
            let food = foods[(foodTableView.indexPathForSelectedRow?.row)!]
            destination.image = food.image
            destination.name = food.name
            destination.price = String(food.default_price ?? 0)
        }
    }
}


extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
