//
//  ContentView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
		// MARK: - PROPERTIES
		
		// MARK: - BODY
		
		// MARK: - FOOTER
		ZStack {
			VStack(spacing: 0) {
				NavigationBarView()
					.padding(.horizontal, 15)
					.padding(.bottom)
					.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
					.background(.white)
					.shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
				
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: 0) {
						FeaturedTabView()
							.frame(height: UIScreen.main.bounds.width / 1.475)
							.padding(.vertical, 20)
						
						CategoryGridView()
						
						TitleView(title: "Helmets")
						
						LazyVGrid(columns: gridLayout, spacing: 15) {
							ForEach(products) { product in
								ProductItemView(product: product)
							}
						} //: LazyVGrid
						.padding(15)
						
						FooterView()
							.padding(.horizontal)
					} //: VSTACK
				} //: SCROLLVIEW
			} //: VSTACK
			.background(colorBackground.ignoresSafeArea(.all, edges: .all))
		} //: ZSTACK
		.ignoresSafeArea(.all, edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
