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
        Map(position: $cameraPosition) {
            ForEach(brechos) { brecho in
                Marker(
                    brecho.nome,
                    coordinate: brecho.coordinate
                )
            }
        }
        .navigationTitle("Brechós de Fortaleza")
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
    NavigationStack {
        PesquisaView()
    }
}
