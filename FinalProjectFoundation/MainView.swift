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

        ZStack {

            TabView {

                Tab("Brechós", systemImage: "house") {
                    Brechoview()
                }

                Tab("Próximos a mim", systemImage: "list.star") {
                    ProximosView()
                }
            }

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
                    .padding(.trailing, 20)
                    .padding(.bottom, 8)
                }
            }
        }
        .sheet(isPresented: $mostrarPesquisa) {
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
