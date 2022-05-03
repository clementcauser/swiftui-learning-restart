//
//  HomeView.swift
//  Restart
//
//  Created by Clément Causer on 02/05/2022.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // HEADER
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4)
                        .repeatForever(), value: isAnimating)
            }

            // CENTER
            Text("The time that leads to mastery is dependant of the intensity of our focus.")
                .font(.system(.title3))
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // FOOTER
            Spacer()

            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        isAnimating = true
                    })
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
