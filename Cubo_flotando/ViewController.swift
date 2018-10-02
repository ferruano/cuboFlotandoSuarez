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
    
    @IBOutlet weak var GraficaTiempo: ParametricFunctionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelLado.text=String(SliderLado.value) + " m"
        LabelTiempo.text=String(SliderTiempo.value) + " seg"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func cambioSlider(_ sender: UISlider) {
        let t = sender.value
        LabelLado.text = String(round(100*t)/100) + " m"
        
    }
    
    @IBAction func cambioSliderBottom(_ sender: UISlider) {
        let t = sender.value
        LabelTiempo.text = String(round(100*t)/100) + " seg"
    }
}

