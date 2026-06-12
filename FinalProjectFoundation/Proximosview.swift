//
//  Proximosview.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI

struct ProximosView: View {

    let brechos = [
        Brecho(
            nome: "Susclo brechó",
            endereco: "Loja Física",
            descricao: "ABERTO",
            imagem: UIImage(resource: .susclo).pngData()
        ),

        Brecho(
            nome: "Elegante Fortaleza Brechó",
            endereco: "Loja Física",
            descricao: "ABERTO",
            imagem: UIImage(resource: .elegante).pngData()
        )
    ]

    var body: some View {

        NavigationStack {

            ScrollView {

                LazyVStack(spacing: 20) {

                    ForEach(brechos) { brecho in

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
                    }
                }
                .padding()
            }
            .navigationTitle("Brechós")
        }
    }
}

#Preview {
    ProximosView()
}
