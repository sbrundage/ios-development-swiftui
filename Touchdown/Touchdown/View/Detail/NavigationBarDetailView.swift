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
			
			Button(action: {}) {
				Image(systemName: "cart")
					.font(.title)
					.foregroundColor(.white)
			}
		} //: HStack
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
			.previewLayout(.sizeThatFits)
			.padding()
			.background(Color.gray)
    }
}
