//
//  VerExamenViewController.swift
//  ExamenesAlumnosEjercicioCorregido
//
//  Created by Ignacio Campillos Serrano on 26/10/2023.
//

import UIKit

class VerExamenViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbTotalPreguntas: UILabel!
    @IBOutlet weak var lbTotalAcertadas: UILabel!
    @IBOutlet weak var lbNotaFinal: UILabel!
    
    //Variables de logica
    
    var examen: Examen!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbNombre.text = examen.nombre
        lbTotalPreguntas.text = "Preguntas: \(examen.totalPreguntas)"
        lbTotalAcertadas.text = "Aciertos: \(examen.totalAcertadas)"
        lbNotaFinal.text = "Nota Final: \(String(examen.notaFinal))"

    }

}
