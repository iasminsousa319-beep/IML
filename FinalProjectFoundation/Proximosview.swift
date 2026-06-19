//
//  Proximosview.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct ProximosView: View {

    @Query var Proximos: [Brecho]

    var body: some View {

        NavigationStack {

            ScrollView {

                LazyVStack(spacing: 15) {

                    ForEach(Proximos) { brecho in

                        HStack(alignment: .top, spacing: 15) {

                            TelaPrincipalImageView(
                                imagem: brecho.imagem
                            )

                            VStack(alignment: .leading, spacing: 10) {

                                Text(brecho.nome)
                                    .font(.title3)
                                    .bold()

                                Text(brecho.endereco)
                                    .font(.headline)

                                Text(brecho.descricao)
                                    .foregroundStyle(.green)
                                    .bold()
                            }

                            Spacer()
                        }
                        .padding()
                        .background(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black.opacity(0.3), lineWidth: 1)

                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Próximos a mim")
                   .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ProximosView()
        .modelContainer(
            for: [Brecho.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
