//
//  AtributosNombres.swift
//  7TablasApp
//
//  Created by djdenielb on 19/04/22.
//

import Foundation
import UIKit

//Struct para los atributos para crear los objetos personalizados en el array
struct AtributosNombres{
    let nombre: String
    let apellido: String
    let imagen: UIImage
}

//    Array para crear el objeto de los nombres
    let arrayTablasNombres = [
        AtributosNombres(nombre: "Adrian", apellido: "Tenorio", imagen: UIImage(named: "adrian")!),
        AtributosNombres(nombre: "Daniel", apellido: "Mateos", imagen: UIImage(named: "daniel")!),
        AtributosNombres(nombre: "Lupe", apellido: "Castro", imagen: UIImage(named: "lupe")!)
    ]
