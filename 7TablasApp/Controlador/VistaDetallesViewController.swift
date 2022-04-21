//
//  VistaDetallesViewController.swift
//  7TablasApp
//
//  Created by djdenielb on 19/04/22.
//

import UIKit

class VistaDetallesViewController: UIViewController {
    
//    Creamos las variables que van a recibir los datos, cada una sera del tipo de objeto que pertence, y la que recibe la variable seleccion que sera tipo int, todas son opcionales para no tener que llenarla con valor por defecto
    var recibirDatosNombres: AtributosNombres?
    var recibirDatosEquipos: AtributosEquipos?
    var recibirIntSeleccion: Int?
    
//    Variables graficas
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelSubtitulo: UILabel!
    @IBOutlet weak var iVFoto: UIImageView!
    
//    Funcion que se carga al inciar app
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Dentro del viewDidLoad, primero un if que compara la variable seleccion para eso la traje, si es 0 quiere decir que este en la seccion 0, si es 1 que esta en la seccion 1
//        - si es 0 entonces los labels y las imagenes las reemplaza con lo que trae la variable que ya tiene viene llena con el objeto nombre y ya solo elegimos el atributo que va a mostrar nombre, apellido, imagen etc
//        - en caso de que sea 1, hace lo mismo pero con el objeto de equipo
        if recibirIntSeleccion == 0{
        labelTitulo.text = recibirDatosNombres?.nombre
        labelSubtitulo.text = recibirDatosNombres?.apellido
        iVFoto.image = recibirDatosNombres?.imagen
        }else if recibirIntSeleccion == 1{
            labelTitulo.text = recibirDatosEquipos?.nombre
            labelSubtitulo.text = ""
            iVFoto.image = recibirDatosEquipos?.imagen
        }
    }
    

}
