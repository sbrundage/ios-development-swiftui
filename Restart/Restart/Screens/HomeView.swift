//
//  HomeView.swift
//  Restart
//
//  Created by Stephen Brundage on 12/5/21.
//

import SwiftUI

struct HomeView: View {
	
	// MARK: - PROPERTY
	
	@AppStorage(StorageKeys.onboarding.rawValue) var isOnboardingViewActive: Bool = false

	// MARK: - BODY
	
    var body: some View {
		VStack(spacing: 20) {
			// MARK: - HEADER
			
			Spacer()
			
			ZStack {
				CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
				
				Image("character-2")
					.resizable()
					.scaledToFit()
				.padding()
			} //: ZStack
			
			// MARK: - CENTER
			
			Text("The time that leads to mastery is dependent on the intensity of our focus.")
				.font(.title3)
				.fontWeight(.light)
				.foregroundColor(.secondary)
				.multilineTextAlignment(.center)
				.padding()
			
			// MARK: - FOOTER
			
			Spacer()
			
			Button {
				isOnboardingViewActive = true
			} label: {
				Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
					.imageScale(.large)
				Text("Restart")
					.font(.system(.title3, design: .rounded))
					.fontWeight(.bold)
			} //: Button
			.buttonStyle(.borderedProminent)
			.buttonBorderShape(.capsule)
			.controlSize(.large)
		} //: VSTACK
    }
}

// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
