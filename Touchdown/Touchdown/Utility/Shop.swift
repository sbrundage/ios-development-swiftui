//
//  Shop.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/22/22.
//

import Foundation

class Shop: ObservableObject {
	
	@Published private(set) var showingProduct: Bool = false
	@Published var selectedProduct: Product? {
		didSet {
			showingProduct = selectedProduct != nil ? true : false
		}
	}
	@Published private(set) var itemsInCart: Bool = false
	
	private(set) var productQuantity: [Product: Int] = [:]
	
	func addProducts(quantity: Int) {
		
		guard let selectedProduct = selectedProduct else {
			print("DEBUG ERROR - No selected product found")
			return
		}

		if (productQuantity[selectedProduct] != nil) {
			productQuantity[selectedProduct]! += quantity
		} else {
			productQuantity[selectedProduct] = quantity
		}
		
		if !productQuantity.isEmpty { itemsInCart = true }
		
		print("Updated Quantity for \(selectedProduct.name): \(productQuantity[selectedProduct]!)")
	}
}
