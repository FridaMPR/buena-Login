//
//  ViewControllerPantallaBienvenida.swift
//  Login
//
//  Created by ALUMNOS on 30/09/26.
//

import UIKit

class ViewControllerPantallaBienvenida: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mostrartexto()
    }

    

    @IBOutlet weak var nombrecuaad: UITextField!
    
    @IBOutlet weak var apellidoText: UITextField!
    
    @IBOutlet weak var edadTEXT: UITextField!
    
    
    @IBOutlet weak var direccionTEXT: UITextField!
    
    
    func mostrartexto () {
        nombrecuaad.text = "\(nombres[indiceUsuario])"
        
        apellidoText.text = "\(apellido[indiceUsuario])"
        
        edadTEXT.text = "\(edad[indiceUsuario])"
        
        direccionTEXT.text = "\(direccion[indiceUsuario])"
    }
    
    
    @IBAction func actualizardatos(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Pantallaregistro", sender: ViewControllerPantallaregistro.self)
    }
    
}
