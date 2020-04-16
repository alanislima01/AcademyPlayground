import Foundation


import UIKit
import PlaygroundSupport

public class Despedida : UIViewController {
    
    //Botao aq p conseguir td codigo ver
    
    let background = UIImageView()
    let falaBoop = UIImageView()
    let quadro = UIImageView()
    let poteDeRacao = UIImageView()
    let boopSorrindo = UIImageView()
    let arranhador = UIImageView()

    
    
    override public func loadView() {
        
        let view = UIView()
        self.view = view

        background.image = UIImage(named: "chaoBoop")
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        falaBoop.image = UIImage (named: "falaObgd")
        falaBoop.frame = CGRect(x: 764, y: 232, width: 321, height: 211)
        
        poteDeRacao.image = UIImage (named: "poteRacao")
        poteDeRacao.frame = CGRect(x: 971 ,y: 756 , width: 145 , height: 76)
        
        boopSorrindo.image = UIImage (named: "boopSorrindo")
        boopSorrindo.frame = CGRect(x: 425, y: 490, width:329, height: 345)
        
        arranhador.image = UIImage (named: "arranhadorBoop")
        arranhador.frame = CGRect(x: 1187, y: 615, width: 224, height: 230)
        
        quadro.image = UIImage(named: "quadro")
        quadro.frame = CGRect(x: 116, y: 232, width: 195, height: 233)
        
        view.addSubview(background)
        view.addSubview(falaBoop)
        view.addSubview(poteDeRacao)
        view.addSubview(arranhador)
        view.addSubview(boopSorrindo)
        view.addSubview(quadro)
        
                
        //target eh acao do botao. self diz q eh dentro do view controller.
    }
    
}
