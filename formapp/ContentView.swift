//
//  ContentView.swift
//  formapp
//
//  Created by user274669 on 2025/7/9.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var showSavedMessage: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Simple Form App")
                .font(.title)
                .fontWeight(.bold)

            TextField("Enter text here", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Save") {
                // Save to UserDefaults
                UserDefaults.standard.set(inputText, forKey: "savedText")

                // Show saved message
                withAnimation {
                    showSavedMessage = true
                }

                // Hide message after 2 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        showSavedMessage = false
                    }
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            if showSavedMessage {
                Text("Text saved successfully!")
                    .foregroundColor(.green)
                    .padding(.top, 10)
                    .transition(.opacity)
            }
        }
        .padding()
        .onAppear {
            // Load saved text when view appears
            if let savedText = UserDefaults.standard.string(forKey: "savedText") {
                inputText = savedText
            }
        }
    }
}

#Preview {
    ContentView()
}
