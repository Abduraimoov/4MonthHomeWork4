//
//  Product.swift
//  4MonthHomeWork4
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

struct Product {
    var productImage: UIImage
    var productName: String
    var fullProductName: String
    var item: String
    var price: Int
    var detailedProductImage: UIImage
    
    func totalPrice(for quantity: Int) -> Int {
           return price * quantity
       }
}
