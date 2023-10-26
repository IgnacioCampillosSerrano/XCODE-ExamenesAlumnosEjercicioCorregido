//
//  Examen.swift
//  ExamenesAlumnosEjercicioCorregido
//
//  Created by Ignacio Campillos Serrano on 26/10/2023.
//

import Foundation

class Examen{
    var nombre: String
    var totalPreguntas: Int
    var totalAcertadas: Int
    var notaFinal: Float!
    
    init(nombre: String, totalPreguntas: Int, totalAcertadas: Int)
    {
        self.nombre = nombre;
        self.totalPreguntas = totalPreguntas;
        self.totalAcertadas = totalAcertadas;
        
        self.notaFinal = calcular()
    }
    
    func calcular()->Float{
        return Float(totalAcertadas) / Float(totalPreguntas)*10
    }
    
    func toString()->String{
        return "Nombre: \(nombre)\n Preguntas:\(totalPreguntas)\n Total Acertadas: \(totalAcertadas)\n Nota Final: \(String(notaFinal))"
        
    }
}
