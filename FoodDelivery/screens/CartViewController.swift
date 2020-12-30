//
//  CartViewController.swift
//  FoodDelivery
//
//  Created by Akira Watanabe on 12/30/20.
//

import UIKit

class CartViewController: UIViewController {
    
    var foods: [FoodCD] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var foodList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        foodList.delegate = self
        foodList.dataSource = self
        fetchCart()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchCart()
    }
    func fetchCart() {
        print("fetchinG")
        do{
            self.foods = try context.fetch(FoodCD.fetchRequest())
            
            DispatchQueue.main.async {
                self.foodList.reloadData()
            }

        }catch{
        }
    }
    

}


extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        let foodObj = Food(image: food.image ?? "", name: food.name ?? "", default_price: Int64(food.price ?? "0"))
        cell.setFood(food: foodObj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){ (action, view, completionHandler) in
            let person = self.foods[indexPath.row]
            self.context.delete(person)
                
            try? self.context.save()
            
            self.fetchCart()
           
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
 
}
