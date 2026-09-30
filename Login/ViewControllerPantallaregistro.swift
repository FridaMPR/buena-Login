//
//  ViewControllerPantallaregistro.swift
//  Login
//
//  Created by ALUMNOS on 21/10/26.
//

import UIKit

class ViewControllerPantallaregistro: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBOutlet weak var nombreusuariochart: UITextField!
    
    @IBOutlet weak var nombrechart: UITextField!
    
    @IBOutlet weak var apellidochart: UITextField!
    
    @IBOutlet weak var direccionchart: UITextField!
    
    @IBOutlet weak var edadchart: UITextField!
    
    @IBOutlet weak var contrasenachart: UITextField!
    
    
    
    @IBAction func regiistrarse(_ sender: UIButton) {
        if nombreusuariochart.text!.isEmpty || nombrechart.text!.isEmpty || apellidochart.text!.isEmpty || direccionchart.text!.isEmpty || edadchart.text!.isEmpty || contrasenachart.text!.isEmpty{
            
            displayerror()
        }
        
        else {
            guardardatos()
        } }
    
    
    func guardardatos() {
        nombres.append(nombrechart.text ?? "" )
        apellido.append(apellidochart.text ?? "" )
        
        direccion.append(direccionchart.text ?? "" )
        password.append(contrasenachart.text ?? "" )
        nombreusuario.append(nombreusuariochart.text ?? "" )
        let edadNumero = Int(edadchart.text ?? "") ?? 0
        edad.append(edadNumero )
    }
    
    
    func displayerror () {
        let mensaje = "Hay un espacio vacio:("
        let alert = UIAlertController(title: "ERROR", message: mensaje, preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: AyudaError (_:))
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func AyudaError (_ action: UIAlertAction)
    
    {}
    
    
    
    
    
    @IBAction func salir(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ViewController", sender: ViewController.self)
    }
    
}
