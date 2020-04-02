//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    //Botao aq p conseguir td codigo ver
    let botaoVamosLa = UIButton()
  
    @IBAction func botaoTocado() {
        print("Vamos lá!")
    }
    

    override func loadView() {
        
        let view = UIView()
        let background = UIImageView()
        background.image = UIImage(named: "chaoBoop")
        background.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)

        //background.image = #imageLiteral(resourceName: "chaoBoop.png")
        
        

        let labelBoasVindas = UILabel()
        labelBoasVindas.frame = CGRect(x: 661, y: 223, width: 761, height: 226)
        labelBoasVindas.text = "Olá, seja bem-vindo; eu sou o Boop! Vou levar você para várias aventuras!"
        labelBoasVindas.textColor = #colorLiteral(red: 0.6042942405, green: 0.604398489, blue: 0.6042804718, alpha: 1)


        let vamosLa = UIImage (named: "vamosLa")
        botaoVamosLa.frame = CGRect(x: 973, y: 504, width: 278, height: 93)
        botaoVamosLa.setTitle("", for: .normal)
        botaoVamosLa.setBackgroundImage(vamosLa, for: .normal)
        botaoVamosLa.setTitleColor(.black, for: .normal)

        
        view.addSubview(background)
        view.addSubview(botaoVamosLa)
        view.addSubview(labelBoasVindas)
        //view.sendSubviewToBack(background) //ele manda a imagem para tras, para nao interagir
                
        
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

