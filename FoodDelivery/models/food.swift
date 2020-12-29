//
//  Food.swift
//  FoodDelivery
//
//  Created by Akira Watanabe on 12/12/20.
//

import Foundation
import UIKit

 
struct Food: Decodable{
    let image: String
    let name: String
    let default_price: Int64?
}
