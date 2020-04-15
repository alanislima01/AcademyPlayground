import UIKit
import Foundation


public class Templo: UIViewController {

    let backgroundTemplo = UIImageView()
    let backgroundVermelho = UIImageView()
    let boop = UIImageView()
    let presente1 = UIButton()
    let presente2 = UIButton()
    let confete = UIImageView()
    let quadro = UIImageView()
    let botaoHome = UIButton()
 //ver com kiev se posso fazer Array co as 4 msgs tb
    
    
    @objc func tocarBotaoHome() {
        print("foi para a home")
        let novaViewController = MyViewController()
        show(novaViewController, sender: nil)
    }
    
    //fazer funcao de clicar no presente1 e ele ir crescendo tipo animação
    //fazwe a funcao do presente2 para
    
    override public func loadView(){
        
        let viewTemplo = UIView()
        self.view = viewTemplo
        
        backgroundTemplo.image = UIImage(named: "backgroundTemplo")
        backgroundTemplo.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        backgroundVermelho.image = UIImage(named: "vermelhoFundo")
        backgroundVermelho.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        self.backgroundVermelho.isHidden = true
        
        confete.image = UIImage(named: "confete")
        backgroundTemplo.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        boop.image = UIImage(named: "boop")
        boop.frame = CGRect(x: 386, y: 620, width: 210, height: 221)
        
        presente1.setBackgroundImage(UIImage(named: "presente"), for: .normal)
        presente1.frame = CGRect(x: 1308, y: 728, width: 83, height: 83)
        self.presente1.isHidden = false
        
        presente2.setBackgroundImage(UIImage(named: "presente"), for: .normal)
        presente2.frame = CGRect(x: 504, y: 381, width: 408, height: 408)
        self.presente2.isHidden = true
        
        quadro.image = UIImage(named: "quadro")
        quadro.frame = CGRect(x: 553, y: 123, width: 421, height: 504)
        self.quadro.isHidden = true
        
        botaoHome.setBackgroundImage(UIImage(named: "voltarChina"), for: .normal)
        botaoHome.frame = CGRect(x: 15, y: 14, width: 114, height: 107)
        
        
        viewTemplo.addSubview(backgroundTemplo)
        viewTemplo.addSubview(backgroundVermelho)
        viewTemplo.addSubview(confete)
        viewTemplo.addSubview(boop)
        viewTemplo.addSubview(presente1)
        viewTemplo.addSubview(presente2)
        viewTemplo.addSubview(quadro)
        viewTemplo.addSubview(botaoHome)
    
        botaoHome.addTarget(self, action: #selector(OnboardingChina.tocarBotaoHome), for: .touchUpInside)

    }
    
    
    
    

}
