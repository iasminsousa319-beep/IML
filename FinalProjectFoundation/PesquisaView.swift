//
//  PesquisaView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI
import MapKit

struct PesquisaView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var textoPesquisa = "brechó"

    @State private var resultados: [MKMapItem] = []

    @State private var cameraPosition: MapCameraPosition = .automatic

    var body: some View {

        ZStack(alignment: .top) {

            Map(position: $cameraPosition) {

                ForEach(resultados, id: \.self) { item in

                    Marker(
                        item.name ?? "Local",
                        coordinate: item.placemark.coordinate
                    )
                }
            }
            .ignoresSafeArea()

            HStack(spacing: 12) {

                Button {
                    dismiss()
                } label: {

                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .frame(width: 44, height: 44)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }

                HStack {

                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)

                    TextField(
                        "Pesquisar brechó",
                        text: $textoPesquisa
                    )
                    .autocorrectionDisabled()
                    .onSubmit {
                        pesquisar()
                    }

                    if !textoPesquisa.isEmpty {

                        Button {
                            textoPesquisa = ""
                        } label: {

                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .padding(.horizontal, 12)
                .frame(height: 44)
                .background(.white)
                .cornerRadius(12)
                .shadow(radius: 4)
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .onAppear {
            pesquisar()
        }
    }

    func pesquisar() {

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = textoPesquisa

        let search = MKLocalSearch(request: request)

        search.start { response, error in

            guard let response = response else { return }

            resultados = response.mapItems

            if let primeiro = response.mapItems.first {

                cameraPosition = .region(
                    MKCoordinateRegion(
                        center: primeiro.placemark.coordinate,
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.05,
                            longitudeDelta: 0.05
                        )
                    )
                )
            }
        }
    }
}

#Preview {
    PesquisaView()
}
