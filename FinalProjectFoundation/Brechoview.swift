//
//  Brechoview.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite
struct Brechoview: View {

    let exemplo = Brecho(
        nome: "Brechó da Vila",
        endereco: "Benfica",
        descricao: "Roupas seminovas e vintage",
        imagem: UIImage(resource: .benchó).pngData()
    )

    let colunas = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {

            ScrollView {

                LazyVGrid(columns: colunas, spacing: 20) {

                    BrechoCardViewTela(brecho: exemplo)
                  
                }
                .padding()
            }
            .navigationTitle("Brechós")
        }
    }
}

#Preview {
    Brechoview()
}
