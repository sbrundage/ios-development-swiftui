//
//  ContentView.swift
//  Restart
//
//  Created by Stephen Brundage on 12/5/21.
//

import SwiftUI

internal enum StorageKeys: String {
	case onboarding
}

struct ContentView: View {
	// Default to true so Onboarding screen is first screen
	@AppStorage(StorageKeys.onboarding.rawValue) var isOnboardingViewActive: Bool = true
	
    var body: some View {
		ZStack {
			if isOnboardingViewActive {
				OnboardingView()
			} else {
				HomeView()
			}
				
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
