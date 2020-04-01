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
        view.backgroundColor = .systemBlue
        
        let labelBoasVindas = UILabel()
        labelBoasVindas.frame = CGRect(x: 661, y: 223, width: 761, height: 226)
        labelBoasVindas.text = "Olá, seja bem-vindo; eu sou o Boop! Vou levar você para várias aventuras!"
        labelBoasVindas.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(labelBoasVindas)

        botaoVamosLa.frame = CGRect(x: 973, y: 504, width: 278, height: 93)
        botaoVamosLa.setTitle("Vamos lá!", for: .normal)
        botaoVamosLa.setTitleColor(.black, for: .normal)
        view.addSubview(botaoVamosLa)
        
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

