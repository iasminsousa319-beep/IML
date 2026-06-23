//
//  ContentView.swift
//  FinalProjectFoundation
//
//  Created by Beatriz Leonel on 28/05/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct MainView: View {

    @State private var mostrarPesquisa = false

    var body: some View {
    
        TabView {
            
            Tab("Brechós", systemImage: "house") {
                NavigationStack {
                    ZStack {
                        Brechoview()
                        
                        VStack {
                            Spacer()

                            HStack {
                                Spacer()

                                Button {
                                    mostrarPesquisa = true
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                        .foregroundStyle(.gray)
                                        .frame(width: 60, height: 60)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                }
                                .padding(.trailing, 15)
                                .padding(.bottom, 22)
                            }
                        }
                    
                        .ignoresSafeArea(.all, edges: .bottom)
                    }
                }
            }

            Tab("Próximos a mim", systemImage: "list.star") {
                NavigationStack {
                    ZStack {
                        ProximosView()
                        
                        VStack {
                            Spacer()

                            HStack {
                                Spacer()

                                Button {
                                    mostrarPesquisa = true
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .font(.title2)
                                        .foregroundStyle(.gray)
                                        .frame(width: 60, height: 60)
                                        .background(.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                }
                                .padding(.trailing, 15)
                                .padding(.bottom, 22)
                            }
                        }
                       
                        .ignoresSafeArea(.all, edges: .bottom)
                    }
                }
            }
        }
        
        .fullScreenCover(isPresented: $mostrarPesquisa) {
            PesquisaView()
        }
    }
}

#Preview {
    MainView()
        .modelContainer(
            for: [Brecho.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
