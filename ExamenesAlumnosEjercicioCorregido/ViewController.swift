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
    
    func alertError(titulo: String, mensaje: String){
        //Crear alerta
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        //Agregar boton a la alerta
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        //Añadir el alert a la actividad (show)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indice = txtPosicionLista.text!
        
        if indice.isEmpty{
            alertError(titulo: "ERROR", mensaje: "Pon un indice")
        }else{
            if Int(indice)! < 1 || Int(indice)! > listaExamenes.count {
                alertError(titulo: "ERROR", mensaje: "Posicion incorrecta")
            }else{
                //Si el identificador del segue es ver, entonces el destino del segue es el controllador de la otra actividad, y le pasas a la variable examen (de la otra actividad) el examen con indice X de la listaExamenes
                if segue.identifier == "VER"{
                    let destino = segue.destination as! VerExamenViewController
                    destino.examen = listaExamenes[Int(indice)! - 1]
                }
            }
        }
    }
}

