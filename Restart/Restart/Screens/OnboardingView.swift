//
//  OnboardingView.swift
//  Restart
//
//  Created by Stephen Brundage on 12/5/21.
//

import SwiftUI

struct OnboardingView: View {
	
	@AppStorage(StorageKeys.onboarding.rawValue) var isOnboardingViewActive: Bool = true
	
	@State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
	@State private var buttonOffset: CGFloat = 0
	@State private var isAnimating: Bool = false
	@State private var imageOffset: CGSize = .zero
	@State private var indicatorOpacity: Double = 1
	@State private var textTitle: String = "Share."
	
	// MARK: - BODY
	
    var body: some View {
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea(.all, edges: .all)
			
			VStack(spacing: 20) {
				
				Spacer()
				
				// MARK: - HEADER
				
				VStack(spacing: 0) {
					Text(textTitle)
						.font(.system(size: 60))
						.fontWeight(.heavy)
						.foregroundColor(.white)
						.transition(.opacity)
						.id(textTitle)
					
					Text("It's not how much we give but how much love we put into giving")
						.font(.title3)
						.fontWeight(.light)
						.foregroundColor(.white)
						.multilineTextAlignment(.center)
						.padding(.leading, 40)
						.padding(.trailing, 40)
						.padding(.horizontal, 10)
				} //: HEADER
				.opacity(isAnimating ? 1 : 0)
				.offset(y: isAnimating ? 0 : -40)
				.animation(.easeOut(duration: 1), value: isAnimating)
				
				// MARK: - CENTER
				
				ZStack {
					CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
						.offset(x: imageOffset.width * -1)
						.blur(radius: abs(imageOffset.width / 5))
						.animation(.easeOut(duration: 1), value: imageOffset)
					
					Image("character-1")
						.resizable()
						.scaledToFit()
						.opacity(isAnimating ? 1 : 0)
						.animation(.easeOut(duration: 0.5), value: isAnimating)
						.offset(x: imageOffset.width * 1.2, y: 0)
						.rotationEffect(.degrees(Double(imageOffset.width / 20)))
						.gesture(
							DragGesture()
								.onChanged({ gesture in
									if abs(imageOffset.width) <= 150 {
										imageOffset = gesture.translation
									}
									
									withAnimation(.linear(duration: 0.25)) {
										indicatorOpacity = 0
										textTitle = "Give."
									}
								})
								.onEnded({ _ in
									imageOffset = .zero
									
									withAnimation(.linear(duration: 0.25)) {
										indicatorOpacity = 1
										textTitle = "Share."
									}
								})
						) //: GESTURE
						.animation(.easeOut(duration: 1), value: imageOffset)
				} //: CENTER
				.overlay(
					Image(systemName: "arrow.left.and.right.circle")
						.font(.system(size: 44, weight: .ultraLight))
						.foregroundColor(.white)
						.offset(y: 20)
						.opacity(isAnimating ? 1 : 0)
						.animation(.easeOut(duration: 1).delay(2), value: isAnimating)
						.opacity(indicatorOpacity)
					, alignment: .bottom
				) //: Swipe Right / Left Image Overlay
				
				Spacer()
				
				// MARK: - FOOTER
				
				ZStack {
					
					// 1. BACKGROUND (STATIC)
					
					Capsule()
						.fill(Color.white.opacity(0.2))
					Capsule()
						.fill(Color.white.opacity(0.2))
						.padding(8)
					
					// 2. CALL-TO-ACTION (STATIC)
					
					Text("Get Started")
						.font(.system(.title3, design: .rounded))
						.fontWeight(.bold)
						.foregroundColor(.white)
						.offset(x: 20)
					
					// 3. CAPSULE (DYNAMIC WIDTH)
					
					HStack {
						Capsule()
							.fill(Color("ColorRed"))
							.frame(width: buttonOffset + 80)
						Spacer()
						
					}
					
					// 4. Circle (Draggable)
					
					HStack {
						ZStack {
							Circle()
								.fill(Color("ColorRed"))
							Circle()
								.fill(.black.opacity(0.15))
								.padding(8)
							Image(systemName: "chevron.right.2")
								.font(.system(size: 24, weight: .bold))
						}
						.foregroundColor(.white)
						.frame(width: 80, height: 80, alignment: .center)
						.offset(x: buttonOffset)
						.gesture(
							DragGesture()
								.onChanged({ gesture in
									if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
										buttonOffset = gesture.translation.width
									}
								})
								.onEnded({ _ in
									if buttonOffset > buttonWidth / 2 {
										withAnimation {
											buttonOffset = buttonWidth - 80
										}
										DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
											withAnimation(Animation.easeOut(duration: 0.4)) {
												isOnboardingViewActive = false
											}
										}
									} else {
										withAnimation {
											buttonOffset = 0
										}
									}
								})
						) //: Gesture
						
						Spacer()
					} //: HStack
					
				} //: FOOTER
				.frame(width: buttonWidth, height: 80, alignment: .center)
				.padding()
				.opacity(isAnimating ? 1 : 0)
				.offset(y: isAnimating ? 0 : 40)
				.animation(.easeOut(duration: 1), value: isAnimating)
				
			} //: VSTACK
		} //: ZSTACK
		.onAppear {
			isAnimating = true
		}
		.preferredColorScheme(.dark)
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
