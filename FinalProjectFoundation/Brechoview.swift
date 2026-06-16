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
                    ForEach(brechos) { brecho in
                        BrechoCardViewTela(brecho: brecho)
                    }
//                    BrechoCardViewTela(brecho: exemplo)
//                    BrechoCardViewTela(brecho: exemplo)
//                    BrechoCardViewTela(brecho: exemplo)
//                    BrechoCardViewTela(brecho: exemplo)
//                    BrechoCardViewTela(brecho: exemplo)
//                    BrechoCardViewTela(brecho: exemplo)
                  
                }
                .padding()
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
