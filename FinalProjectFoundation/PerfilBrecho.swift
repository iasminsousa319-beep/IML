//
//  PerfilBrecho.swift
//  FinalProjectFoundation
//
//  Created by Found on 18/06/26.
//

import SwiftUI
import SwiftData
import MapKit

struct PerfilBrecho: View {
    let brecho: Brecho
    @Environment(\.dismiss) private var dismiss
    
    @State private var posicaoCamera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -3.7441, longitude: -38.5358),
            span: MKCoordinateSpan(latitudeDelta: 0.012, longitudeDelta: 0.012)
        )
    )
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    ZStack(alignment: .topLeading) {
                        if let imgData = brecho.imagem, let uiImage = UIImage(data: imgData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 220)
                                .clipped()
                        } else {
                            Color.yellow
                                .frame(height: 220)
                        }
                    }
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .frame(width: 40, height: 40)
                                .background(.white.opacity(0.8))
                                .clipShape(Circle())
                        }
                        .padding(.top, 16)
                        .padding(.leading, 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(brecho.nome)
                                .font(.title)
                                .bold()
                            
                            HStack(spacing: 4) {
                                Text("4,9")
                                    .font(.subheadline)
                                    .bold()
                                ForEach(0..<5) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                        .font(.caption)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(brecho.descricao)
                                .font(.body)
                            
                            Text("Tamanho das peças do PP ao GG.")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Horário de funcionamento:")
                                .font(.headline)
                            Text("De segunda a sexta-feira: 10:00–19:00")
                            Text("sábado: 09:00–15:00")
                            Text("Domingo: Fechado")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Localização")
                                .font(.title3)
                                .bold()
                            
                            Text(brecho.endereco)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Map(position: $posicaoCamera) {
                                Marker(brecho.nome, coordinate: CLLocationCoordinate2D(latitude: -3.7441, longitude: -38.5358))
                                    .tint(.blue)
                            }
                            .frame(height: 180)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        
            Divider()
            HStack(spacing: 0) {
                Button(action: {
                   
                }) {
                    HStack {
                        Image(systemName: "camera")
                        Text("Instagram")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.primary)
                    .font(.body)
                    .fontWeight(.medium)
                }
                
                Divider()
                    .frame(height: 24)
                
                Button(action: {
               
                }) {
                    HStack {
                        Image(systemName: "message")
                        Text("Whatsapp")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundStyle(.primary)
                    .font(.body)
                    .fontWeight(.medium)
                }
            }
            .background(Color(.systemBackground))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    let exemplo = Brecho(
        nome: "Benchó",
        endereco: "Av. Treze de Maio, 2344 - Loja A - Benfica",
        descricao: "Brechó de roupas vintage e atuais, peças femininas e masculinas. 🛍️",
        imagem: nil
    )
    
    return NavigationStack {
        PerfilBrecho(brecho: exemplo)
    }
}
