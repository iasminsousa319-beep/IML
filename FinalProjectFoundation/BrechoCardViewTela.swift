//
//  BrechoCardViewTela.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI

struct BrechoCardViewTela: View {
    let brecho: Brecho
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TelaPrincipalImageView(imagem: brecho.imagem)
                .frame(width: 160, height: 160)
            
            Text(brecho.nome)
                .font(.headline)
            
            Text(brecho.endereco)
                .font(.subheadline)
            
            Text(brecho.descricao)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(width: 190)
        .overlay(
            RoundedRectangle(cornerRadius: 13.0)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

#Preview {
    
    let fotoDeTeste = UIImage(resource: .benchó).pngData();
    
    let exemplo = Brecho(
        nome: "Benchó",
        endereco: "Benfica",
        descricao: "Roupas seminovas e vintage",
        imagem: fotoDeTeste
    )

    BrechoCardViewTela(brecho: exemplo)
}
