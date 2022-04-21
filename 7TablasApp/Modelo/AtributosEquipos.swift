//
//  AtributosEquipos.swift
//  7TablasApp
//
//  Created by djdenielb on 19/04/22.
//

import Foundation
import UIKit

//Struct para los atributos para crear los objetos personalizados en el array
struct AtributosEquipos{
    let nombre: String
    let imagen: UIImage
}

//    Array para crear el objeto de los equipos
    let arrayTablasEquipos = [
        AtributosEquipos(nombre: "America", imagen: UIImage(named: "america")!),
        AtributosEquipos(nombre: "Guadalajara", imagen: UIImage(named: "chivas")!)
    ]
