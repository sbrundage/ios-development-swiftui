//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/20/22.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
	
	@State private var quantity: Int = 0
	
    var body: some View {
		HStack(alignment: .center, spacing: 6) {
			Button(action: {
				if quantity > 0 {
					quantity -= 1
				}
			}) {
				Image(systemName: "minus.circle")
			}
			
			Text("\(quantity)")
				.fontWeight(.semibold)
				.frame(minWidth: 36)
			
			Button(action: {
				quantity += 1
			}) {
				Image(systemName: "plus.circle")
			}
			
			Spacer()
			
			Button(action: {}) {
				Image(systemName: "heart.circle")
					.foregroundColor(.pink)
			}
		} //: HStack
		.font(.system(.title, design: .rounded))
		.foregroundColor(.black)
		.imageScale(.large)
    }
}

struct QuantityFavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavoriteDetailView()
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
