//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/19/22.
//

import SwiftUI

struct ProductDetailView: View {
	
	@EnvironmentObject var shop: Shop
	
	@State private var itemQuanity: Int = 0
	
    var body: some View {
		
		VStack(alignment: .leading, spacing: 5) {
			
			// NAVBAR
			NavigationBarDetailView()
				.padding(.horizontal)
				.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
			
			// HEADER
			HeaderDetailView()
				.padding(.horizontal)
			
			// DETAIL TOP PART
			TopPartDetailView()
				.padding(.horizontal)
				.zIndex(1)
			
			// DETAIL BOTTOM PART
			VStack(alignment: .center, spacing: 0) {
				// RATINGS + SIZES
				RatingsSizesDetailView()
					.padding(.top, -25)
					.padding(.bottom, 10)
				
				// DESCRIPTION
				ScrollView(.vertical, showsIndicators: false) {
					Text(shop.selectedProduct?.description ?? "")
						.font(.system(.body, design: .rounded))
						.foregroundColor(.gray)
						.multilineTextAlignment(.leading)
				} //: ScrollView
				
				// QUANTITY + FAVORITE
				QuantityFavoriteDetailView(quantity: $itemQuanity)
					.padding(.vertical, 10)
				
				// ADD TO CART
				AddToCartDetailView(quantity: $itemQuanity)
					.padding(.bottom, 20)
				
			} //: VStack
			.padding(.horizontal)
			.background(
				Color.white
					.clipShape(CustomShape())
					.padding(.top, -105)
			)
		} //: VStack
		.zIndex(0)
		.ignoresSafeArea(.all, edges: .all)
		.background(
			Color(red: shop.selectedProduct?.red ?? 0, green: shop.selectedProduct?.green ?? 0, blue: shop.selectedProduct?.blue ?? 0)
				.ignoresSafeArea(.all, edges: .all)
		)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
			.previewLayout(.fixed(width: 375, height: 812))
    }
}
