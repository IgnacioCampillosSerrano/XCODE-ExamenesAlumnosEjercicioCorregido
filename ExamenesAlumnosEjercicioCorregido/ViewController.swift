//
//  ViewController.swift
//  ExamenesAlumnosEjercicioCorregido
//
//  Created by Ignacio Campillos Serrano on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtPosicionLista: UITextField!
    @IBOutlet weak var txtTotalAcertadas: UITextField!
    @IBOutlet weak var txtTotalPreguntas: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    
    //VARIABLES PARA LA LÓGICA
    
    var listaExamenes:[Examen]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listaExamenes = []
    }


    @IBAction func btnInsertarExamen(_ sender: Any) {
        let nombre = txtNombre.text!
        let totalP = txtTotalPreguntas.text!
        let totalA = txtTotalAcertadas.text!
        
        if nombre.isEmpty || totalP.isEmpty || totalA.isEmpty {
            //MOSTRAR ERROR (alert)
            alertError(titulo: "ERROR ", mensaje: "Faltan datos")
        }else{
            //GUARDAR INFO EN LISTA
            listaExamenes.append(Examen(nombre: nombre, totalPreguntas: Int(totalP)!, totalAcertadas: Int(totalA)!))
            txtNombre.text = "";
            txtTotalAcertadas.text = "";
            txtTotalPreguntas.text = "";
        }
        
        
    }
    

    @IBAction func btnVerExamen(_ sender: Any) {
        let indice = txtPosicionLista.text!
        
        if indice.isEmpty{
            alertError(titulo: "ERROR", mensaje: "Pon un indice")
        }else{
            if Int(indice)! < 1 || Int(indice)! > listaExamenes.count {
                alertError(titulo: "ERROR", mensaje: "Posicion incorrecta")
            }else{
                lbResultado.text = listaExamenes[Int(indice)! - 1].toString()
            }
        }
        
    }
    
    func alertError(titulo: String, mensaje: String){
        //Crear alerta
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        //Agregar boton a la alerta
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        //Añadir el alert a la actividad (show)
        self.present(alert, animated: true, completion: nil)
    }
    }

