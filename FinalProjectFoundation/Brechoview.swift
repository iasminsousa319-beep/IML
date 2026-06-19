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
    
    @Query var brechos: [Brecho]

    let exemplo = Brecho(
        nome: "Brechó da Vila",
        endereco: "Benfica",
        descricao: "Roupas seminovas e vintage",
        imagem: nil
    )

    let colunas = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colunas, spacing: 30) {
                    ForEach(brechos) { brecho in
                        NavigationLink(destination: PerfilBrecho(brecho: brecho)) {
                            BrechoCardViewTela(brecho: brecho)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(8)
            }
            .navigationTitle("Brechós")
        }
    }
}

#Preview {
    Brechoview()
        .modelContainer(
            for: [Brecho.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
