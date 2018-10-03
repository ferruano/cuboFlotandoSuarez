//
//  flotabilidad.swift
//  Cubo_flotando
//
//  Created by Saerco on 2/10/18.
//  Copyright © 2018 upm. All rights reserved.
//

import Foundation

class flotabilidadCubo {
    
//Valor de la fuerza de la gravedad
    let fuerzaGravedad = 9.8
    
    func velocidadAngular(_ tamañoCubo: Double) -> Double {
        let velocidadAngular = sqrt((2*fuerzaGravedad)/tamañoCubo)
        return velocidadAngular
    }
    func posicionZ(tiempo: Double, tamañoCubo: Double) -> Double {
        let w = velocidadAngular(tamañoCubo)
        let z = (tamañoCubo * cos(w * tiempo)) / 2
        return z
    }
    func velocidad(tiempo: Double, tamañoCubo: Double) -> Double {
        let w = velocidadAngular(tamañoCubo)
        let v = -(tamañoCubo * w * sin(w * tiempo)) / 2
        return v
    }
    func aceleracion(tiempo: Double, tamañoCubo: Double) -> Double {
        let w = velocidadAngular(tamañoCubo)
        let a = -fuerzaGravedad * cos(w * tiempo)
        return a
    }
    
}
