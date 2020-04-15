
import UIKit
import PlaygroundSupport

public class MyViewController : UIViewController {
    
    //Botao aq p conseguir td codigo ver
    let botaoVamosLa = UIButton()
    let fala1Boop = UILabel()
    
    
    @objc func botaoTocado() {
        print("Apertou o botao -> Vamos lá!")
        let novaViewController = OnboardingChina(screenType: .mac , isPortrait: true)
        navigationController?.pushViewController(novaViewController, animated: false)
        //so executa se tiver "?"
        //colocar is Hidding aqui
        //o ? diz que vai procurar no sistema a navigationController para fazer a acao
    }
    
    
    override public func loadView() {
        
        let view = UIView()
        self.view = view

        let background = UIImageView()
        background.image = UIImage(named: "chaoBoop")
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        let fala1Boop = UIImageView()
        fala1Boop.image = UIImage (named: "fala1Boop")
        fala1Boop.frame = CGRect(x: 601, y: 134, width: 786, height: 309)
        
        let vamosLa = UIImage (named: "vamosLa")
        botaoVamosLa.frame = CGRect(x: 973, y: 504, width: 278, height: 93)
        botaoVamosLa.setTitle("", for: .normal)
        botaoVamosLa.setBackgroundImage(vamosLa, for: .normal)
        botaoVamosLa.setTitleColor(.black, for: .normal)
        
        let poteDeRacao = UIImageView()
        poteDeRacao.image = UIImage (named: "poteRacao")
        poteDeRacao.frame = CGRect(x: 971 ,y: 756 , width: 145 , height: 76)
        
        let boopSorrindo = UIImageView()
        boopSorrindo.image = UIImage (named: "boopSorrindo")
        boopSorrindo.frame = CGRect(x: 425, y: 490, width:329, height: 345)
        
        let arranhador = UIImageView()
        arranhador.image = UIImage (named: "arranhadorBoop")
        arranhador.frame = CGRect(x: 1187, y: 615, width: 224, height: 230)
        
        view.addSubview(background)
        view.addSubview(fala1Boop)
        view.addSubview(botaoVamosLa)
        view.addSubview(poteDeRacao)
        view.addSubview(arranhador)
        view.addSubview(boopSorrindo)
                
        botaoVamosLa.addTarget(self, action: #selector(MyViewController.botaoTocado), for: .touchUpInside)
        //target eh acao do botao. self diz q eh dentro do view controller.
    }
    
}
