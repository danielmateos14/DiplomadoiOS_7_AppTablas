//
//  ViewController.swift
//  7TablasApp
//
//  Created by djdenielb on 18/04/22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tablaPrototipo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        Delegados del table
        tablaPrototipo.dataSource = self
        tablaPrototipo.delegate = self
    }

//    Funciones protocolo Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaPrototipo.dequeueReusableCell(withIdentifier: "celdaPrototipo", for: indexPath)
        return celda
    }

}

