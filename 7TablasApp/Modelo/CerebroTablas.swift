//
//  CerebroTablas.swift
//  7TablasApp
//
//  Created by djdenielb on 19/04/22.
//

import Foundation
import UIKit

struct CerebroTablas{
    
//    Creamos 2 variable que sea del tipo de los objetos y el ponemos unos valores por default
    var baseObjetoNombres = AtributosNombres(nombre: "", apellido: "", imagen: UIImage(systemName: "person")!)
    var baseObjetoEquipos = AtributosEquipos(nombre: "", imagen: UIImage(systemName: "person")!)
    

//    Funcion que crea el objeto dependiendo del row seleccionado, llamara al row que es el numero de celda es como un contador, despues con el if comparamos si row es = 0 entonces llenamos el objeto con lo que haya en la posicion 0 del array de nombres que seria adrian y luego si es 1 va a llenar con el apeelido y asi sucesivamente
    mutating func creaObjetoNombresRow(row: Int) -> AtributosNombres{
        if row == 0{
            baseObjetoNombres = arrayTablasNombres[row]
        }else if row == 1{
            baseObjetoNombres = arrayTablasNombres[row]
        }else if row == 2{
            baseObjetoNombres = arrayTablasNombres[row]
        }
        return baseObjetoNombres
    }
    
//    Esta sera igual la funcion anterior solo que esta llena el objeto con el array de equipos, al final retorna el objeto lleno
    
    mutating func creaObjetoEquiposRow(row: Int) -> AtributosEquipos{
        if row == 0{
            baseObjetoEquipos = arrayTablasEquipos[row]
        }else if row == 1{
            baseObjetoEquipos = arrayTablasEquipos[row]
        }
        
        return baseObjetoEquipos
    }
}
