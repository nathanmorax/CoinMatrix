//
//  ProfileHeaderView.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 30/06/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
           
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
                .clipShape(Circle())

            
            
            VStack(alignment: .leading) {
                Text("Hi Kavak bank")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Welcome back")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button(action: {
                // Acción del botón
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .clipShape(Circle())

            }
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    ProfileHeaderView()
}
