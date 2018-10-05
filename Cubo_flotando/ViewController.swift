//
//  ViewController.swift
//  Cubo_flotando
//
//  Created by Saerco on 1/10/18.
//  Copyright © 2018 upm. All rights reserved.
//

import UIKit

let model = flotabilidadCubo()

class ViewController: UIViewController, ParametricFunctionViewDataSource{


    @IBOutlet weak var labelLado: UILabel!
    @IBOutlet weak var sliderLado: UISlider!
    @IBOutlet weak var graficaPosicion: ParametricFunctionView!
    @IBOutlet weak var graficaVelocidad: ParametricFunctionView!
    @IBOutlet weak var graficaAceleracion: ParametricFunctionView!
    @IBOutlet weak var sliderTiempo: UISlider!
    @IBOutlet weak var labelTiempo: UILabel!
    @IBOutlet weak var graficaVelocidadPosicion: ParametricFunctionView!
    @IBOutlet weak var func1label: UILabel!
    @IBOutlet weak var func2label: UILabel!
    @IBOutlet weak var func3label: UILabel!
    
    var tiempo: Double = 0.0 {
        didSet {
            graficaPosicion.setNeedsDisplay()
            graficaVelocidad.setNeedsDisplay()
            graficaAceleracion.setNeedsDisplay()
            graficaVelocidadPosicion.setNeedsDisplay()
        }
    }
    var tamañoLado: Double = 1.0 {
        didSet {
            graficaPosicion.setNeedsDisplay()
            graficaVelocidad.setNeedsDisplay()
            graficaAceleracion.setNeedsDisplay()
            graficaVelocidadPosicion.setNeedsDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graficaPosicion.dataSource = self
        graficaVelocidad.dataSource = self
        graficaAceleracion.dataSource = self
        graficaVelocidadPosicion.dataSource = self
        
    
        sliderTiempo.sendActions(for: .valueChanged)
        sliderLado.sendActions(for: .valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func cambioEscala(_ sender: UIPinchGestureRecognizer) {
        let f  = sender.scale
        
        graficaPosicion.scaleX *= Double(f)
        graficaPosicion.scaleY *= Double(f)
        
        graficaVelocidad.scaleX *= Double(f)
        graficaVelocidad.scaleY *= Double(f)
        
        graficaAceleracion.scaleX *= Double(f)
        graficaAceleracion.scaleY *= Double(f)
        
        graficaVelocidadPosicion.scaleX *= Double(f)
        graficaVelocidadPosicion.scaleY *= Double(f)
        
        
        sender.scale = 1
    }
/*
    @IBAction func cambioVistasGraficas(_ sender: UIGestureRecognizer) {
        if graficaVelocidad != nil {
            graficaVelocidad.removeFromSuperview()
            graficaAceleracion.removeFromSuperview()
        }
        if graficaVelocidad == nil {
            graficasView.addSubview(graficaVelocidad)
            graficasView.addSubview(graficaAceleracion)
        }
    }
    */
    @IBAction func cambioSliderBottom(_ sender: UISlider) {
        tiempo = Double(sender.value)
        let t = round(100*tiempo)/100
        labelTiempo.text = String(t) + " s"
        
        let z = model.posicionZ(tiempo: tiempo, tamañoCubo: tamañoLado)
        let label1 = round(100*z)/100
        func1label.text = String(label1) + " m"
        
        let v = model.velocidad(tiempo: tiempo, tamañoCubo: tamañoLado)
        let label2 = round(100*v)/100
        func2label.text = String(label2) + " m/s"
        
        let a = model.aceleracion(tiempo: tiempo, tamañoCubo: tamañoLado)
        let label3 = round(100*a)/100
        func3label.text = String(label3) + " m/s^2"
        
        graficaPosicion.setNeedsDisplay()
        graficaVelocidad.setNeedsDisplay()
        graficaAceleracion.setNeedsDisplay()
        graficaVelocidadPosicion.setNeedsDisplay()
        
    }
    @IBAction func cambioSlider(_ sender: UISlider) {
        tamañoLado = Double(sender.value)
        let s = round(100*tamañoLado)/100
        labelLado.text = String(s) + " m"
        
        let z = model.posicionZ(tiempo: tiempo, tamañoCubo: tamañoLado)
        let label1 = round(100*z)/100
        func1label.text = String(label1) + " m"
        
        let v = model.velocidad(tiempo: tiempo, tamañoCubo: tamañoLado)
        let label2 = round(100*v)/100
        func2label.text = String(label2) + " m/s"
        
        let a = model.aceleracion(tiempo: tiempo, tamañoCubo: tamañoLado)
        let label3 = round(100*a)/100
        func3label.text = String(label3) + " m/s^2"
        
        graficaPosicion.setNeedsDisplay()
        graficaVelocidad.setNeedsDisplay()
        graficaAceleracion.setNeedsDisplay()
        graficaVelocidadPosicion.setNeedsDisplay()
        
    }
    func startIndexFor(_ functionView: ParametricFunctionView) -> Double {
        return 0
    }
    
    func endIndexFor(_ functionView: ParametricFunctionView) -> Double {
        
        return 10
    }
    
    func functionView(_ functionView: ParametricFunctionView, pointAt index: Double) -> FunctionPoint {
        let t = index
        setScale(functionView)
        switch functionView {
        case graficaPosicion:
            let z = model.posicionZ(tiempo: t, tamañoCubo: tamañoLado)
            return FunctionPoint(x: t, y: z)
        case graficaVelocidad:
            let v = model.velocidad(tiempo: t, tamañoCubo: tamañoLado)
            return FunctionPoint(x: t, y: v)
        case graficaAceleracion:
            let a = model.aceleracion(tiempo: t, tamañoCubo: tamañoLado)
            return FunctionPoint(x: t, y: a)
        case graficaVelocidadPosicion:
            let z = model.posicionZ(tiempo: t, tamañoCubo: tamañoLado)
            let v = model.velocidad(tiempo: t, tamañoCubo: tamañoLado)
            return FunctionPoint(x: z, y: v)
        default:
            return FunctionPoint(x: 0, y: 0)
        }
    }
    
    func pointsOfInterestFor(_ functionView: ParametricFunctionView) -> [FunctionPoint] {
        let t = tiempo
        setScale(functionView)
        switch functionView {
        case graficaPosicion:
            let z = model.posicionZ(tiempo: t, tamañoCubo: tamañoLado)
            return [FunctionPoint(x: t, y: z)]
        case graficaVelocidad:
            let v = model.velocidad(tiempo: t, tamañoCubo: tamañoLado)
            return [FunctionPoint(x: t, y: v)]
        case graficaAceleracion:
            let a = model.aceleracion(tiempo: t, tamañoCubo: tamañoLado)
            return [FunctionPoint(x: t, y: a)]
        case graficaVelocidadPosicion:
            let z = model.posicionZ(tiempo: t, tamañoCubo: tamañoLado)
            let v = model.velocidad(tiempo: t, tamañoCubo: tamañoLado)
            return [FunctionPoint(x: z, y: v)]
        default:
            return [FunctionPoint(x: 0, y: 0)]
        }
    }
    
    func setScale(_ functionView: ParametricFunctionView){
        if functionView == graficaVelocidadPosicion {
            functionView.scaleX = Double((functionView.bounds.size.width * 8) / 414)
            functionView.scaleY = Double((functionView.bounds.size.height * 8) / 337.5)
        } else {
            functionView.scaleX = Double((functionView.bounds.size.width * 21) / 414)
            functionView.scaleY = Double((functionView.bounds.size.height * 2) / 112.5)
        }
    }
    
    
}

