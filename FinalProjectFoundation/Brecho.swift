//
//  Brecho.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

@SQLiteTable("brechos")
@Model
class Brecho: Identifiable {

    var id: Int
    var nome: String
    var endereco: String
    var descricao: String
    var imagem: Data?

    init(
        id: Int = Int.random(in: 0...100),
        nome: String,
        endereco: String,
        descricao: String,
        imagem: Data?
    ) {
        self.id = id
        self.nome = nome
        self.endereco = endereco
        self.descricao = descricao
        self.imagem = imagem
    }
}
