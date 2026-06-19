//
//  PesquisaView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI
import MapKit

struct BrechoMapa: Identifiable {
    let id = UUID()
    let nome: String
    let coordinate: CLLocationCoordinate2D
}

struct PesquisaView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var textoPesquisa = ""

    let brechos = [
        BrechoMapa(
            nome: "Brechó Exemplo",
            coordinate: CLLocationCoordinate2D(
                latitude: -3.7304,
                longitude: -38.5299
            )
        )
    ]

    @State private var cameraPosition: MapCameraPosition =
        .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: -3.7304,
                    longitude: -38.5299
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.02,
                    longitudeDelta: 0.02
                )
            )
        )

    var body: some View {
        NavigationStack {

            Map(position: $cameraPosition) {
                ForEach(brechos) { brecho in
                    Marker(
                        brecho.nome,
                        coordinate: brecho.coordinate
                    )
                }
            }
            .searchable(
                text: $textoPesquisa,
                prompt: "Pesquisar brechó"
            )

            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
            }
        }
    }
}

struct BrechoS: Identifiable {
    let id = UUID()
    let nome: String
    let endereco: String
    let descricao: String
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    PesquisaView()
}
