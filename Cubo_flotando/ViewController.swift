//
//  ViewController.swift
//  Cubo_flotando
//
//  Created by Saerco on 1/10/18.
//  Copyright © 2018 upm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelLado: UILabel!
    @IBOutlet weak var SliderLado: UISlider!
    
    @IBOutlet weak var GraficaPosicion: ParametricFunctionView!
    @IBOutlet weak var GraficaVelocidad: ParametricFunctionView!
    @IBOutlet weak var GraficaAceleracion: ParametricFunctionView!
    @IBOutlet weak var SliderTiempo: UISlider!
    @IBOutlet weak var LabelTiempo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

