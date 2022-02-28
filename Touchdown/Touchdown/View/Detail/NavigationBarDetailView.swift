//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/19/22.
//

import SwiftUI

struct NavigationBarDetailView: View {
	
	@EnvironmentObject var shop: Shop
	
    var body: some View {
		HStack {
			Button(action: {
				feedback.impactOccurred()
				
				withAnimation(.easeIn) {
					shop.selectedProduct = nil
				}
			}) {
				Image(systemName: "chevron.left")
					.font(.title)
					.foregroundColor(.white)
			}
			
			Spacer()
			
			Button(action: {
				
			}) {
				ZStack {
					Image(systemName: "cart")
						.font(.title)
					.foregroundColor(.white)
					
					if shop.itemsInCart {
						Circle()
							.fill(.red)
							.frame(width: 14, height: 14, alignment: .center)
							.offset(x: 13, y: -10)
							.animation(.easeIn, value: shop.itemsInCart)
					}
				}
			}
		} //: HStack
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
			.environmentObject(Shop())
			.previewLayout(.sizeThatFits)
			.padding()
			.background(Color.gray)
    }
}
