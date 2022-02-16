//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/10/22.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
		TabView {
			ForEach(players) { player in
				FeaturedItemView(player: player)
					.padding(.top, 10)
					.padding(.horizontal, 15)
			}
		} //: TABVIEW
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
			.background(.gray)
    }
}
