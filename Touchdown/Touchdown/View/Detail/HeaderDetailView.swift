//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/19/22.
//

import SwiftUI

struct HeaderDetailView: View {
    var body: some View {
		VStack(alignment: .leading, spacing: 6) {
			Text("Protective Gear")
			
			Text(sampleProduct.name)
				.font(.largeTitle)
				.fontWeight(.black)
		} //: VStack
		.foregroundColor(.white)
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView()
			.previewLayout(.sizeThatFits)
			.padding()
			.background(Color.gray)
    }
}
