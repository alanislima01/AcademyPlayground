//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    //Botao aq p conseguir td codigo ver
    let botaoVamosLa = UIButton()
    let fala1Boop = UILabel()
  
    @IBAction func botaoTocado() {
        print("Vamos lá!")
    }
    

    override func loadView() {
        
        let view = UIView()
        let background = UIImageView()
        background.image = UIImage(named: "chaoBoop")
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)

        let fala1Boop = UIImageView()
        fala1Boop.image = UIImage (named: "fala1Boop")
        fala1Boop.frame = CGRect(x: 601, y: 134, width: 786, height: 309)

                //background.image = #imageLiteral(resourceName: "chaoBoop.png")
                
                

        //        let labelBoasVindas = UILabel()
        //        labelBoasVindas.frame = CGRect(x: 661, y: 223, width: 761, height: 226)
        //        labelBoasVindas.text = "Olá, seja bem-vindo; eu sou o Boop! Vou levar você para várias aventuras!"
        //        labelBoasVindas.textColor = #colorLiteral(red: 0.6042942405, green: 0.604398489, blue: 0.6042804718, alpha: 1) --> para colocar uma label seria assim

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
    }
}
   
// Present the view controller in the Live View window
    let viewController = MyViewController()
    let vc = MyViewController(screenType: .mac , isPortrait: true)
    PlaygroundPage.current.liveView = vc.scale(to: 0.4)

