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
	
    var body: some View {
		Button(action: {
			feedback.impactOccurred()
			shop.addProducts(quantity: quantity)
		}) {
			Spacer()
			Text("ADD TO CART")
				.font(.system(.title2, design: .rounded))
				.fontWeight(.bold)
				.foregroundColor(.white)
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
    }
}

struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
		AddToCartDetailView(quantity: .constant(0))
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
