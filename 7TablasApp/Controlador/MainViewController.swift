//
//  ViewController.swift
//  7TablasApp
//
//  Created by djdenielb on 18/04/22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    Instancia de cerebro tablas, creamos 2 variables del tipo de los objetos que vamos a llenar equipos y nombres, se crea una variable que servira para que en la siguiente pantalla se pueda hacer una comparacion y con eso saber que objeto mostrar
    var cerebroTablas = CerebroTablas()
    var objetoNombreCreado: AtributosNombres?
    var objetoEquipoCreado: AtributosEquipos?
    var variableSeleccionObjetoSegundaPantalla: Int?
    
//    Variables graficas
    @IBOutlet weak var tablaPrototipo: UITableView!
    
//    Metodo que se carga cuando incia la app
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Delegados del table, estos son para que se muestren los datos en el VC, el delegado le dice quien los va a llenar y quien los va a mostrar
        tablaPrototipo.dataSource = self
        tablaPrototipo.delegate = self
    }

//    Funciones protocolo Table
    
//    Esta primera funcion es para saber el numero de filas que tendra cada seccion, si solo hay una seccion y la vas a llenar con un array se poner el tamaño del array como retorno, si son varias seccion se hace un switch y dice que si estamos en la seccion 0 o sea la primera entonces aqui llamamos al tamaño del array de nombres y en el segundo caso llamamos al array de equipos
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section{
        case 0:
            return arrayTablasNombres.count
        case 1:
            return arrayTablasEquipos.count
        default:
            return 1
        }
    }
    
//    Esta segunda funcion dice cual sera el formato de la celda o sea como se vera y que tendra dentro
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        Primero creamos una variable que sera igual al nombre que le dimos a la variable grafica de la tabla con el metodo dequeueReusable y dentro de los parametros ponemos el nombre de la celda y un indexpath que es un contador
        let celda2 = tablaPrototipo.dequeueReusableCell(withIdentifier: "celdaPrototipo", for: indexPath)

//        MARK: No funciono para el detail
//        let celda = UITableViewCell()
        
        
//        Despues hacemos un switch con ese indexpath pero con el punto le indicamos que se aplicara en la seccion o sea en caso de que seccion sea 0 o 1 etc
//        - En caso de que sea 0, la variable celda2 en su propiedad textlabel que es el titulo de la celda, sera igual a lo que tenga el array tablas nombres en su posicion indexpatch o sea 0 pero en su row o sea en su fila 0 que seria nombre, despues en su propiedad detaillabel que seria el subtitulo lo mismo pero con apellido, despues la imagen
//        - En caso de que sea 1, entonces lo mismo que en el caso 0 pero con el array de equipos
//        - el default dira que la celda no es valida
//        - Al final retorna la celda 2 ya llenada
        switch indexPath.section{
        case 0:
            celda2.textLabel?.text = arrayTablasNombres[indexPath.row].nombre
            celda2.detailTextLabel?.text = arrayTablasNombres[indexPath.row].apellido
            celda2.imageView?.image = arrayTablasNombres[indexPath.row].imagen
            
              /*      MARK: No funciono para el detail
            celda.textLabel?.text = cerebroTablas.arrayTablasNombres[indexPath.row].nombre
            celda.detailTextLabel?.text = cerebroTablas.arrayTablasNombres[indexPath.row].apellido
            celda.detailTextLabel?.text = "holaaaaaaa"
            celda.imageView?.image = cerebroTablas.arrayTablasNombres[indexPath.row].imagen*/
            
        case 1:
            celda2.textLabel?.text = arrayTablasEquipos[indexPath.row].nombre
            celda2.imageView?.image = arrayTablasEquipos[indexPath.row].imagen
            
              /*      MARK: No funciono para el detail
            celda.textLabel?.text = cerebroTablas.arrayTablasEquipos[indexPath.row].nombre
            celda.imageView?.image = cerebroTablas.arrayTablasEquipos[indexPath.row].imagen*/
            
        default:
            celda2.textLabel?.text = "Celda no valida"
        }
        
        return celda2
    }
    
//    La tercera funcion de la celda es para indicarle el numero de secciones que tendra, esto seria igual numero de elementos que tenga el array secciones que tengo en un archivo aparte
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayTablasSecciones.count
    }
    
    
//    La cuarta funcion la que indica el titulo que tendra cada seccion, igual hara una comparacion con un if, en caso  de que sea 0 le vas a poner lo que tenga el arraysecciones en su posicion 0 en su atributo seccion que es un string y asi con la segunda y el else dira seccion no valida
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return arrayTablasSecciones[section].seccion
        }else if section == 1{
            return arrayTablasSecciones[section].seccion
        }else{
            return "Seccion no valida"
        }
    }
    
    
//    Esta cuarta funcion es para seleccionar una celda, que va a pasar al seleccionar una celda, se crea un switch con un indexpath o sea un contador y se aplica a la seccion
//    - En caso de que sea 0, mandamos a llamar la variable objetoNombreCreado y la llenamos con la funcion de crear objeto nombre que esta en cerebro
//    - Despues la variabel de seleccion la pongo en 0
//    - Y despues utilizo el segue para indicar que esos datos van a ser enviados a otra pantalla
//    - En caso de que sea 1, hace lo mismo pero con el objeto de equipo y la funcion de equipo
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            objetoNombreCreado = cerebroTablas.creaObjetoNombresRow(row: indexPath.row)
            variableSeleccionObjetoSegundaPantalla = 0
            performSegue(withIdentifier: "segueDetalles", sender: self)
        case 1:
            objetoEquipoCreado = cerebroTablas.creaObjetoEquiposRow(row: indexPath.row)
            variableSeleccionObjetoSegundaPantalla = 1
            performSegue(withIdentifier: "segueDetalles", sender: self)
        default:
            return
        }
    }
    
//    Funcion que envia los datos a la segunda pantalla, tenemos que enviar la variable de objeto creado de nombre y la otra de equipo estas variables ya van llenas cada una con el objeto que le corresponde dependiendo la seccion y el nombre y la fila seleccionada, tambien envio la variable de seleccion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetalles"{
            let enviarDatos = segue.destination as! VistaDetallesViewController
            enviarDatos.recibirDatosNombres = objetoNombreCreado
            enviarDatos.recibirDatosEquipos = objetoEquipoCreado
            enviarDatos.recibirIntSeleccion = variableSeleccionObjetoSegundaPantalla
        }
    }
    
}

