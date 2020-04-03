//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    //Botao aq p conseguir td codigo ver
    let botaoVamosLa = UIButton()
    let fala1Boop = UILabel()
  
    @IBAction func botaoTocado() {
        print("Apertou o botao -> Vamos lá!")
        let novaViewController = OnboardingChina()
        show(novaViewController, sender: nil)
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
        
        view.addSubview(background);
        view.addSubview(fala1Boop);
        view.addSubview(botaoVamosLa);
        view.addSubview(poteDeRacao);
        view.addSubview(arranhador);
        view.addSubview(boopSorrindo)

        self.view = view

    }
      
    override func viewDidLoad() {

        botaoVamosLa.addTarget(self, action: #selector(MyViewController.botaoTocado), for: .touchUpInside)
        
        //target eh acao do botao. self diz q eh dentro do view controller.
    }
}
   

class OnboardingChina: UIViewController {
//a classe eh a nova tela,é uma nova viewcontroller
    
    let superBotao = UIButton()
    
    @IBAction func tocarSuperBotao(){
        print("Tocou em alguma parte da tela")
        let novaViewController = telaChina1()
        show(novaViewController, sender: nil)
        
    }
    
    
    override func loadView(){
        
    
        let viewChina = UIView()
        self.view = viewChina

        let backgroundChina = UIImageView()
        backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
        backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)

        let explicacaoChina = UIImageView()
        explicacaoChina.image = UIImage (named: "onboardingChinaTexto")
        explicacaoChina.frame = CGRect(x: 273, y: 338, width: 931, height: 162)
    
        let superBotao = UIImageView()
        superBotao.image = UIImage (named: "transparente")
        superBotao.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)

        view.addSubview(backgroundChina);
        view.addSubview(explicacaoChina);
        view.addSubview(superBotao)
        
        self.view = view
        
    }

    override func viewDidLoad() {

        superBotao.addTarget(self, action: #selector(OnboardingChina.tocarSuperBotao), for: .touchUpInside)
        //target eh acao do botao. self diz q eh dentro do view controller.
    }

}


class telaChina1: UIViewController {
//a classe eh a nova tela,é uma nova viewcontroller
   override func loadView(){


        let viewChina1 = UIView()
        self.view = viewChina1

        let backgroundChina = UIImageView()
        backgroundChina.image = UIImage(named: "ONBOARDINGbackgroudChina")
        backgroundChina.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)

        view.addSubview(backgroundChina);

    
    }
}




// Present the view controller in the Live View window

let viewController = MyViewController()
let navigation = UINavigationController(screenType: .mac , isPortrait: true)
navigation.pushViewController(viewController, animated: false)
PlaygroundPage.current.liveView = navigation.scale(to: 0.4)

