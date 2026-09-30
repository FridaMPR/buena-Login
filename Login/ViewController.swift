//
//  ViewController.swift
//  Login
//
//  Created by ALUMNOS on 30/09/26.
//

import UIKit

var nombreusuario: [String] = ["frida@gmail.com", "michelle@gmail.com", "giuli@gmail.com"]
var nombres: [String] = ["Frida", "Michelle", "Giuli"]
var apellido: [String] = ["Mancilla", "Mercado", "Toscano"]
var edad: [Int] = [20, 44, 21]
var direccion: [String] = ["Isaac Newton 4590", "Av. España 4562", "Av. Morelos 7891"]
var password: [String] = ["kawaii123", "g4y313", "pepito123"]
var indiceUsuario: Int = 0
class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var usuariocchart: UITextField!
    @IBOutlet weak var contraseñachart: UITextField!
    @IBOutlet weak var entrar: UIButton!
    @IBOutlet weak var botonregistrar: UIButton!
    @IBOutlet weak var outletbotonentrar: UIButton!
    
    
    var segundos = 0
    var timer = Timer()
    var intentos = 0
    
    
    
    func arregloanalisisusuario  (usuario:String, passwordIngresada:String) -> Bool {
        var contAdor = 0
    
        if usuario.isEmpty || passwordIngresada.isEmpty{
            return false
        }
        
        else {
            while contAdor < nombreusuario.count {
                if usuario == nombreusuario[contAdor] && passwordIngresada == password [contAdor] {
                    indiceUsuario = contAdor
                    return true
                }
                contAdor += 1
            }
        }
        return false
    }
    
    @IBAction func accionojito(_ sender: UIButton) {
        if (contraseñachart.isSecureTextEntry ==  true) {contraseñachart.isSecureTextEntry = false
            botonojito.setImage (UIImage(systemName: "eye.circle"), for: .normal)}
        else {
            contraseñachart.isSecureTextEntry = true
            botonojito.setImage(UIImage(systemName: "eye.slash.circle"), for: .normal)
        }
        
    }
    
    @IBOutlet weak var botonojito: UIButton!
    
    func analizar (usuario: String, contraseña: String) -> Bool
    {
        if usuario.isEmpty || contraseña.isEmpty {
            
            return false
        } else if contraseña == "kawaii123" && usuario == "uwu321"
        {
            return true}
        return false
    }
    
    @IBAction func entrar(_ sender: Any) {
        
        if (arregloanalisisusuario (usuario: usuariocchart.text!, passwordIngresada: contraseñachart.text!)) {
            self.performSegue(withIdentifier: "pantallabienvenido", sender: ViewControllerPantallaBienvenida.self)
            
        }
        
        else {
            if intentos < 3 {
                intentos = intentos + 1
                displayerror ()
            }
            else {
                mensajebloq()
            }
        }
    }
        
        func displayerror () {
            let mensaje = "Usuario o Contraseña Incorrectas :("
            let alert = UIAlertController(title: "ERROR", message: mensaje, preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "OK", style: .default, handler: AyudaError (_:))
            alert.addAction(dismissAction)
            present(alert, animated: true, completion: nil)
            
        }
        func AyudaError (_ action: UIAlertAction)
        
        {
            
        }
        
        
        
        func Aceptarbloq (_ action: UIAlertAction){
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (ViewController.actionTimer), userInfo:nil, repeats: true)
            
            usuariocchart.text = ""
            contraseñachart.text = ""
            usuariocchart.isEnabled = false
            botonojito.isEnabled = false
            contraseñachart.isEnabled = false
            outletbotonentrar.isEnabled = false
            botonregistrar.isEnabled = false
            
        }
        
        
        @objc func actionTimer() {
            if (segundos >= 5){
                usuariocchart.isEnabled = true
                contraseñachart.isEnabled = true
                outletbotonentrar.isEnabled = true
                botonojito.isEnabled = true
                botonregistrar.isEnabled = true
                timer.invalidate()
                displayDesbloque ()
                intentos = 0
                segundos = 0
            }
            segundos += 1
        }
        
        func mensajebloq () {
            let mensaje = "El sistema ha sido bloqueado."
            let alert = UIAlertController(title: "BLOQUEO", message: mensaje, preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "USH, Ya que :(", style: .default, handler: Aceptarbloq(_:))
            alert.addAction(dismissAction)
            present (alert, animated: true, completion: nil)
            
        }
        
        func displayDesbloque () {
            let mensaje = "Holi de nuevo :D"
            let alert = UIAlertController(title: "Desbloqueado", message: mensaje, preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "YUPIII", style: .default, handler: nil)
            alert.addAction(dismissAction)
            present (alert, animated: true, completion: nil)
        }
        
        func ayudadesbloq () {
            
            segundos = 0
            
        }
        

    
    @IBAction func registrarrr(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Pantallaregistro", sender: ViewControllerPantallaregistro.self)
    }
    
    

    }
