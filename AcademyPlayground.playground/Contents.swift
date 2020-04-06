//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
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
    
    
    override func loadView() {
        
        let view = UIView()
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
        
        self.view = view
        
        botaoVamosLa.addTarget(self, action: #selector(MyViewController.botaoTocado), for: .touchUpInside)
        //target eh acao do botao. self diz q eh dentro do view controller.
    }
    
    override func viewDidLoad() {
    }
}

//----------------------------separa--------


class OnboardingChina: UIViewController{
    //a classe eh a nova tela,é uma nova viewcontroller
    
    let superBotao = UIButton()
    let botaoProximo = UIButton()
    let explicacaoChina = UIImageView()
    let fala1ChinaBoop = UIImageView()
    let fala2ChinaBoop = UIImageView()
    let botaoHome = UIButton()
    let boopSorrindo = UIImageView()
    let backgroundChina = UIImageView()
    var botaoPressionado: Int = 0
    
    @objc func funcaoBotaoHome() {
        print("foi para a home")
        let novaViewController = MyViewController()
        show(novaViewController, sender: nil)
    }
    
    @objc func tocarSuperBotao(){
        print("Tocou em alguma parte da tela")
        self.explicacaoChina.isHidden = true
        boopFalandoNaChina()
    
    }
    
    @objc func tocarBotaoProximo(){
        switch self.botaoPressionado {
        case 0:
            self.fala1ChinaBoop.isHidden = true
            self.fala2ChinaBoop.isHidden = false
        case 1:
            self.fala2ChinaBoop.isHidden = true
        default:
            self.botaoPressionado += 1
        }

        

        
    }
    
    override func loadView(){
    //override sobrescreve uma funcao da classe pai, q no caso eh uiviewcontroller
            
            let viewChina = UIView()
            self.view = viewChina

            backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
            backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
            
            explicacaoChina.image = UIImage (named: "onboardingChinaTexto")
            explicacaoChina.frame = CGRect(x: 273, y: 338, width: 931, height: 162)
            
            superBotao.setBackgroundImage(UIImage(named: "transparente"), for: .normal)
            superBotao.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
            
            viewChina.addSubview(backgroundChina)
            viewChina.addSubview(explicacaoChina)
            viewChina.addSubview(superBotao)
            
            
            superBotao.addTarget(self, action: #selector(OnboardingChina.tocarSuperBotao), for: .touchUpInside)
            //target eh acao do botao. self diz q eh dentro do view controller.


        }
        
        func boopFalandoNaChina(){
            
            
            backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
            backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
            
            fala1ChinaBoop.image = UIImage (named: "fala1chinaboop")
            fala1ChinaBoop.frame = CGRect(x: 631, y: 235, width: 658, height: 294)
            
            fala2ChinaBoop.image = UIImage (named: "falachina2")
            fala2ChinaBoop.frame = CGRect(x: 637, y: 251, width: 659, height: 305)
            fala2ChinaBoop.isHidden = true
            
            boopSorrindo.image = UIImage (named: "boopSorrindo")//ARRUMAR A FOTO
            boopSorrindo.frame = CGRect(x: 425, y: 490, width:329, height: 345)
            
            botaoProximo.setBackgroundImage(UIImage(named: "setaDireita"), for: .normal)
            botaoProximo.frame = CGRect(x: 1054, y: 577, width: 57, height: 53)
            
            view.addSubview(backgroundChina)
            view.addSubview(fala1ChinaBoop)
            view.addSubview(fala2ChinaBoop)
            view.addSubview(botaoProximo)
            view.addSubview(boopSorrindo)
            
            botaoProximo.addTarget(self, action: #selector(OnboardingChina.tocarBotaoProximo), for: .touchUpInside)
            
        }
        
    }
    
 
    
    class buscandoMonge: UIViewController {
    

        let backgroundChina = UIImageView()
        let macaco = UIImageView()
    
        override func loadView(){
    
            let viewBusca = UIView()
            self.view = viewBusca
    
            backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
            backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
    
            macaco.image = UIImage(named: "macaco")
            macaco.frame = CGRect(x: 631, y: 235, width: 662, height: 320)
            macaco.isHidden = true
    
    
            view.addSubview(backgroundChina);
            view.addSubview(macaco);
    
        }
    }
    

// Present the view controller in the Live View window
let viewController = MyViewController(screenType: .mac , isPortrait: true)
let navigation = UINavigationController(rootViewController: MyViewController(screenType: .mac , isPortrait: true))
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)


