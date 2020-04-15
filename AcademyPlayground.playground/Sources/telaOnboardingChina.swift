import UIKit


public class OnboardingChina: UIViewController{
    //a classe eh a nova tela,é uma nova viewcontroller
    
    let superBotao = UIButton()
    let superBotao2 = UIButton()
    let botaoProximo = UIButton()
    let botaoVoltar = UIButton()
    let explicacaoChina = UIImageView()
    let fala1ChinaBoop = UIImageView()
    let fala2ChinaBoop = UIImageView()
    let botaoHome = UIButton()
    let boopSorrindo = UIImageView()
    let backgroundChina = UIImageView()
    let encontre = UIImageView()
    var botaoPressionado: Int = 0
    
    @objc func tocarBotaoHome() {
        print("foi para a home")
        let novaViewController = MyViewController()
        show(novaViewController, sender: nil)
    }
    
    @objc func tocarSuperBotao(){
        print("Tocou em alguma parte da tela")
        self.explicacaoChina.isHidden = true
        boopFalandoNaChina()
        superBotao.isHidden = true
        
    }
    
    
    @objc func tocarBotaoProximo(sender: UIButton){
        
        if sender.tag == 0{
            self.botaoPressionado -= 1
        }else{
            self.botaoPressionado += 1
        }//aumentando o numero para saber onde o contador ta
        switch self.botaoPressionado {
        case 1:
            self.fala2ChinaBoop.isHidden = false
            self.fala1ChinaBoop.isHidden = true
            self.botaoVoltar.isHidden = false
            print("1a vez")
            print(self.botaoPressionado)
        case 2:
            self.fala1ChinaBoop.isHidden = true
            self.botaoVoltar.isHidden = true
            self.botaoProximo.isHidden = true
            let novaViewController = buscandoMonge(screenType: .mac , isPortrait: true)
            navigationController?.pushViewController(novaViewController, animated: false)
            print(self.botaoPressionado)
            self.encontre.isHidden = false
        default:
            print("obg danilo")
        }
    }
    
    @objc func tocarBotaoVoltar(){
        switch self.botaoPressionado {
        case 1://caso inicial, assim q entra na tela
            self.fala2ChinaBoop.isHidden = true
            self.fala1ChinaBoop.isHidden = false
            self.botaoVoltar.isHidden = true
            print(self.botaoPressionado)
            self.botaoPressionado -= 1
            
        case 2:
            self.fala2ChinaBoop.isHidden = false
            self.fala1ChinaBoop.isHidden = true
            print(self.botaoPressionado)

        case 3:
            self.fala1ChinaBoop.isHidden = true
            self.fala2ChinaBoop.isHidden = true
            print(self.botaoPressionado)

        default:
            self.botaoPressionado -= 1
        }
    }
    
    override public func loadView(){
        //override sobrescreve uma funcao da classe pai, q no caso eh uiviewcontroller
        
        let viewChina = UIView()
        self.view = viewChina
        
        backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
        backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        explicacaoChina.image = UIImage (named: "onboardingChinaTexto")
        explicacaoChina.frame = CGRect(x: 273, y: 338, width: 931, height: 162)
        
        superBotao.setBackgroundImage(UIImage(named: "transparente"), for: .normal)
        superBotao.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        botaoHome.setBackgroundImage(UIImage(named: "voltarChina"), for: .normal)
        botaoHome.frame = CGRect(x: 15, y: 14, width: 114, height: 107)
        
        viewChina.addSubview(backgroundChina)
        viewChina.addSubview(explicacaoChina)
        viewChina.addSubview(superBotao)
        viewChina.addSubview(botaoHome)
        
        
        superBotao.addTarget(self, action: #selector(OnboardingChina.tocarSuperBotao), for: .touchUpInside)
                
        botaoHome.addTarget(self, action: #selector(OnboardingChina.tocarBotaoHome), for: .touchUpInside)

        
        //target eh acao do botao. self diz q eh dentro do view controller.
        
        
    }
    
    func boopFalandoNaChina(){
        
        
        backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
        backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        fala1ChinaBoop.image = UIImage (named: "fala1chinaboop")
        fala1ChinaBoop.frame = CGRect(x: 631, y: 235, width: 658, height: 294)
        
        fala2ChinaBoop.image = UIImage (named: "fala2novo")
        fala2ChinaBoop.frame = CGRect(x: 637, y: 251, width: 659, height: 305)
        fala2ChinaBoop.isHidden = true
        
        boopSorrindo.image = UIImage (named: "boopSorrindo")//ARRUMAR A FOTO
        boopSorrindo.frame = CGRect(x: 309, y: 490, width:303, height: 318)
        
        botaoProximo.setBackgroundImage(UIImage(named: "setaDireita"), for: .normal)
        botaoProximo.frame = CGRect(x: 1000, y: 524, width: 71, height: 66)
        botaoProximo.tag = 1
        
        botaoVoltar.setBackgroundImage(UIImage(named: "botaoEsquerdo"), for: .normal)
        botaoVoltar.frame = CGRect(x: 901, y: 524, width: 71, height: 66)
        botaoVoltar.tag = 0
        botaoVoltar.isHidden = true
        

        view.addSubview(backgroundChina)
        view.addSubview(fala1ChinaBoop)
        view.addSubview(fala2ChinaBoop)
        view.addSubview(botaoProximo)
        view.addSubview(boopSorrindo)
        view.addSubview(botaoVoltar)
        view.addSubview(botaoHome)
        
        botaoProximo.addTarget(self, action: #selector(OnboardingChina.tocarBotaoProximo), for: .touchUpInside)
        botaoVoltar.addTarget(self, action: #selector(OnboardingChina.tocarBotaoVoltar), for:.touchUpInside)
        botaoHome.addTarget(self, action: #selector(OnboardingChina.tocarBotaoHome), for: .touchUpInside)
        
    }

}

