//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/19/22.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
				ForEach(brands) { brand in
					BrandItemView(brand: brand)
				}
			} //: Grid
			.frame(height: 200)
			.padding(15)
		} //: ScrollView
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
			.previewLayout(.sizeThatFits)
			.background(colorBackground)
    }
}
