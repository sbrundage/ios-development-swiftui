//
//  CircleGroupView.swift
//  Restart
//
//  Created by Stephen Brundage on 12/28/21.
//

import SwiftUI

struct CircleGroupView: View {
	
	// MARK: - PROPERTY
	@State var ShapeColor: Color
	@State var ShapeOpacity: Double
	
	// MARK: - BODY
    var body: some View {
		ZStack {
			Circle()
				.stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
				.frame(width: 260, height: 260, alignment: .center)
			Circle()
				.stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
				.frame(width: 260, height: 260, alignment: .center)
		} //: ZStack
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea()
			
			CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
		}
    }
}
