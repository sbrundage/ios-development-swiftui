//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/20/22.
//

import SwiftUI

struct AddToCartDetailView: View {
	
	@EnvironmentObject var shop: Shop
	
	@Binding var quantity: Int
	
	@State private var wasAdded: Bool = false
	
    var body: some View {
		Button(action: {
			feedback.impactOccurred()
			addProductQuantity()
		}) {
			Spacer()
			if wasAdded {
				HStack {
					Text("ADDED")
					Image(systemName: "checkmark.circle")
				}
				.font(.system(size: 20, weight: .bold))
				.foregroundColor(Color.white)
			} else {
				Text("ADD TO CART")
					.font(.system(size: 20, weight: .bold))
					.fontWeight(.bold)
					.foregroundColor(.white)
			}
			Spacer()
		}
		.padding(15)
		.background(
			Color(
				red: shop.selectedProduct?.red ?? sampleProduct.red,
				green: shop.selectedProduct?.green ?? sampleProduct.green,
				blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
		)
		.clipShape(Capsule())
		.disabled(wasAdded)
    }
	
	private func addProductQuantity() {
		wasAdded = true
		shop.addProducts(quantity: quantity)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			wasAdded = false
		}
	}
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
		AddToCartDetailView(quantity: .constant(0))
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
