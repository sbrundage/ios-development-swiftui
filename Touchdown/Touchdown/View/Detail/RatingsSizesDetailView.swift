//
//  RatingsSizesDetailView.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/20/22.
//

import SwiftUI

struct RatingsSizesDetailView: View {
	
	let sizes: [String] = ["XS", "S", "M", "L", "XL"]
	
    var body: some View {
		HStack(alignment: .top, spacing: 3) {
			// RATINGS
			VStack(alignment: .leading, spacing: 3) {
				Text("Ratings")
					.font(.footnote)
					.fontWeight(.semibold)
					.foregroundColor(colorGray)
				
				HStack(alignment: .center, spacing: 3) {
					ForEach(1...5, id: \.self) { num in
						Button(action: {}) {
							Image(systemName: "star.fill")
								.frame(width: 28, height: 28)
								.background(colorGray.cornerRadius(5))
								.foregroundColor(.white)
						}
					}
				}
			} //: VStack
			
			Spacer()
			
			// SIZES
			VStack(alignment: .trailing, spacing: 3) {
				Text("Sizes")
					.font(.footnote)
					.fontWeight(.semibold)
					.foregroundColor(colorGray)
			
				HStack(alignment: .center, spacing: 5) {
					ForEach(sizes, id: \.self) { size in
						Button(action: {}) {
							Text(size)
								.font(.footnote)
								.fontWeight(.black)
								.foregroundColor(colorGray)
								.frame(width: 28, height: 28)
								.background(Color.white.cornerRadius(5))
								.background(
									RoundedRectangle(cornerRadius: 5)
										.stroke(colorGray, lineWidth: 2)
								)
						}
					}
				} //: HStack
			} //: VStack
			
		} //: HStack
    }
}

struct RatingsSizesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsSizesDetailView()
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
