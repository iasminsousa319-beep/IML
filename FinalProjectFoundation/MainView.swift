//
//  ContentView.swift
//  FinalProjectFoundation
//
//  Created by Beatriz Leonel on 28/05/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Brechós", systemImage: "house") {
                // Adicione a tela para listage dos álbuns
            }
            Tab("Proximos a mim", systemImage: "list.star") {
                // Exiba as músicas favoritas do usuário
              
            }
        }
    }
}
#Preview {
    MainView()
}
