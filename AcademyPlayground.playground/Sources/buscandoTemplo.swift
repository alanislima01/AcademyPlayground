import UIKit
import Foundation


public class buscandoTemplo: UIViewController {
    
    let backgroundChina = UIImageView()
    let macaco = UIButton()
    let casinhaChina = UIButton()
    let rato = UIButton()
    let pedra = UIButton()
    let monge = UIButton()
    let boopCalado = UIImageView()
    let msgDeErro = UIImageView()
    let msgDoMonge = UIImageView()
    
    
    @objc func tocarErrado(sender: UIButton){
        
        print("apertou imagem errada")
        self.msgDeErro.isHidden = false
        //Queria saber se depois de um tempo poderia sumir tipo 4s
    }
    
    
    @objc func tocarMonge(sender: UIButton){
        
        print("Achou o monge")
        self.msgDoMonge.isHidden = false
        
        //seria legal uma animação tipo brilhando
        //Queria saber se depois de um tempo poderia sumir tipo 4s
    }
    
    @objc func tocarCasinha(sender: UIButton){
        
        //queria colocar sons de uhu nessa hora
        print("Achou o monge")
        self.msgDeErro.isHidden = true
        
        let novaViewController = Templo(screenType: .mac , isPortrait: true)
        navigationController?.pushViewController(novaViewController, animated: true)
    }
    
    override public func loadView(){
        
        let viewBusca = UIView()
        self.view = viewBusca
        
        backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
        backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        boopCalado.image = UIImage(named: "boopCalado")
        boopCalado.frame = CGRect(x: 400, y: 634, width: 210, height: 221)
        
        msgDeErro.image = UIImage(named: "msgDeErro")
        msgDeErro.frame = CGRect(x: 649, y: 679, width: 339, height: 125)
        msgDeErro.isHidden = true
        
        msgDoMonge.image = UIImage(named: "msgDoMonge")
        msgDoMonge.frame = CGRect(x: 649, y: 679, width: 339, height: 125)
        msgDoMonge.isHidden = true
        
        macaco.setBackgroundImage(UIImage(named: "macaco"), for: .normal)
        macaco.frame = CGRect(x: 620, y: 419, width: 73, height: 90)
        
        casinhaChina.setBackgroundImage(UIImage(named: "casinhaChina"), for: .normal)
        casinhaChina.frame = CGRect(x: 922, y: 598, width: 80, height: 81)
        
        rato.setBackgroundImage(UIImage(named: "rato"), for: .normal)
        rato.frame = CGRect(x: 181, y: 748, width: 110, height: 54)
        
        pedra.setBackgroundImage(UIImage(named: "pedra"), for: .normal)
        pedra.frame = CGRect(x: 1140, y: 795, width: 120, height: 45)
        
        monge.setBackgroundImage(UIImage(named: "monge"), for: .normal)
        monge.frame = CGRect(x: 1400, y: 548, width: 45, height: 55)
        
        
        viewBusca.addSubview(backgroundChina)
        viewBusca.addSubview(macaco)
        viewBusca.addSubview(casinhaChina)
        viewBusca.addSubview(rato)
        viewBusca.addSubview(pedra)
        viewBusca.addSubview(boopCalado)
        viewBusca.addSubview(msgDeErro)
        viewBusca.addSubview(msgDoMonge)
        viewBusca.addSubview(monge)
        
        
        macaco.addTarget(self, action: #selector(buscandoTemplo.tocarErrado), for: .touchUpInside)
        rato.addTarget(self, action: #selector(buscandoTemplo.tocarErrado), for: .touchUpInside)
        pedra.addTarget(self, action: #selector(buscandoTemplo.tocarErrado), for: .touchUpInside)
        monge.addTarget(self, action: #selector(buscandoTemplo.tocarMonge), for: .touchUpInside)
        
        casinhaChina.addTarget(self, action: #selector(buscandoTemplo.tocarCasinha), for: .touchUpInside)
        
    }
}

