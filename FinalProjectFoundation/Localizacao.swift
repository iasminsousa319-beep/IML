//
//  Localizacao.swift
//  FinalProjectFoundation
//
//  Created by Found on 22/06/26.
//
import Foundation
import CoreLocation
import Combine

class Localizacao: NSObject, ObservableObject, CLLocationManagerDelegate {

    let manager = CLLocationManager()

    @Published var status: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()

        manager.delegate = self
        status = manager.authorizationStatus
    }

    func pedirPermissao() {
        manager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }
}
