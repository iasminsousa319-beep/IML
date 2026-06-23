//
//  Proximosview.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite
import CoreLocation
import MapKit

struct ProximosView: View {

    @Query var Proximos: [Brecho]

    @StateObject private var localizacao = Localizacao()
    @State private var mostrarNegado = false

    var body: some View {

        NavigationStack {

            ScrollView {

                LazyVStack(spacing: 15) {

                    ForEach(Proximos) { brecho in

                        NavigationLink(
                            destination: PerfilBrecho(brecho: brecho)
                        ) {

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
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Próximos a mim")
            .navigationBarTitleDisplayMode(.large)

            .onAppear {

                switch localizacao.status {

                case .notDetermined:
                    localizacao.pedirPermissao()

                case .denied,
                     .restricted:

                    mostrarNegado = true

                default:
                    break
                }
            }

            .onChange(of: localizacao.status) { _, novoStatus in

                if novoStatus == .denied ||
                    novoStatus == .restricted {

                    mostrarNegado = true
                }
            }

            .alert(
                "Tem certeza que não autoriza a localização para PertinBrechó?",
                isPresented: $mostrarNegado
            ) {

                Button("Permitir") {

                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                }

                Button("Cancelar", role: .cancel) { }

            } message: {

                Text("O PertinBrechó não poderá mostrar os brechós próximos sem acesso à sua localização.")
            }
        }
    }
}

#Preview {
    ProximosView()
        .modelContainer(
            for: [Brecho.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(
                forResource: "db",
                ofType: "sqlite"
            )!
        )
}
