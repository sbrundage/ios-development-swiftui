//
//  FooterView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/8/22.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
		VStack(alignment: .center, spacing: 10) {
			Text("We offer the most cutting edge, comforatble, lightweight and durable football helments in the market at affordable prices.")
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.layoutPriority(2)
			
			Image("logo-lineal")
				.renderingMode(.template)
				.foregroundColor(.gray)
				.layoutPriority(0)
			
			Text("Copyright © Steve Brundage\nAll right reserved")
				.font(.footnote)
				.fontWeight(.bold)
				.foregroundColor(.gray)
				.multilineTextAlignment(.center)
				.layoutPriority(1)
		} //: VSTACK
		.padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
			.previewLayout(.sizeThatFits)
			.background(colorBackground)
    }
}
