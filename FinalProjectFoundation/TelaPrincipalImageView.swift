//
//  TelaPrincipalImageView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI

struct TelaPrincipalImageView: View {

    let imagem: Data?

    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)

            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)

            if let imagem = imagem,
               let uiImage = UIImage(data: imagem) {

                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 160, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
#Preview {
    TelaPrincipalImageView(
        imagem: UIImage(resource: .benchó).pngData()
    )
}
