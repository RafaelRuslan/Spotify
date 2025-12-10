//
//  AboutView.swift
//  Spotify
//
//  Created by Rafael Agayev on 09.12.25.
//

import SwiftUI

struct AboutView: View {
    
    var appVersion: String{
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }
    
    var buildNumber: String{
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                CardView{
                    HStack(spacing: 16) {
                        Image(systemName: "music.note")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        VStack(alignment: .leading, spacing: 6){
                            Text("Spotify")
                                .font(.title3)
                                .bold()
                            
                            Text("Version: \(appVersion) - \(buildNumber)")
                        }
                        Spacer()
                    }
                }
                CardView {
                    VStack(alignment: .leading, spacing: 8){
                        Text("About the app")
                            .font(.headline)
                        
                        Text("This app is modern music format")
                            .font(.subheadline)
                    }
                    
                }
                CardView {
                    VStack(alignment: .leading, spacing: 8){
                        Text("Developer")
                            .font(.headline)
                        
                        Link(destination: URL(string: "https://www.instagram.com/rarus")!){
                            HStack(spacing: 5) {
                                Image(.instagram)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                                Text(": r.a_rus")
                            }
                        }
                            .font(.subheadline)
                        
                      
                        
                        Link(destination: URL(string: "https://www.github.com/rafaelRuslan")!){
                            HStack(spacing: 5) {
                                Image(.github)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                Text(": rafaelRuslan")
                            }
                        }
                            .font(.subheadline)
                    }
                }
                
                CardView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Legal")
                            .font(.headline)
                        
                        Link("Privacy policy", destination: URL(string: "https://www.apple.com")!)
                            .font(.subheadline)
                        
                        Link("Terms of Service", destination: URL(string: "https://wwww.google.com")!)
                            .font(.subheadline)
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            toolbar
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent{
        ToolbarItem(placement: .principal) {
            Text("About Spotify")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button{
                dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .toolbarStylish()
            }
        }
    }
}



#Preview {
    AboutView()
}
