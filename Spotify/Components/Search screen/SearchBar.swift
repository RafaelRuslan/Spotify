//
//  SearchBar.swift
//  Spotify
//
//  Created by Rafael Agayev on 07.12.25.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var onDone: () -> Void
    
    @State private var debounceWorkItem: DispatchWorkItem? = nil
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
            TextField("Search a music", text: $text)
                .autocorrectionDisabled()
                .foregroundStyle(.primary)
                .onChange(of: text) {
                    debounceWorkItem?.cancel()
                    
                    guard text.count >= 3 else {
                        return
                    }
                    
                    let workItem = DispatchWorkItem {
                        onDone()
                    }
                    debounceWorkItem = workItem
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: workItem)
                }
            
            if !text.isEmpty{
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray.opacity(0.7))
                }
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
}


//#Preview {
//    SearchBar()
//}
