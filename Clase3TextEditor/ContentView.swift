//
//  ContentView.swift
//  Clase3TextEditor
//
//  Created by Escurra Colquis on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var wordCount: Int = 0
    
    var body: some View {
        VStack {
            Text("TextEditor in SwiftUI")
                .padding(.top, 30)
                .padding(.bottom, 50)
                .bold()
                .font(.title)
            VStack(alignment: .center) {
                TextEditor(text: $text)
                    .font(.title2)
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled(true)
                    .padding(.all)
                    .onChange(of: self.text) {
                        let words = self.text.split {
                            $0 == " " || $0.isNewline
                        }
                        self.wordCount = words.count
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, maxHeight: 500)
                HStack(spacing: 4) {
                    Text("\(wordCount)")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                        .bold()
                    Text("palabras")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 20)
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
