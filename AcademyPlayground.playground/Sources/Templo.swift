import UIKit
import Foundation
import AVFoundation
import PlaygroundSupport



public class Templo: UIViewController {
    
    let backgroundTemplo = UIImageView()
    let boop = UIImageView()
    //let presente1 = UIButton() //para fazer a interacao colocar como imagem ???
    let confete = UIImageView()
    let quadro = UIImageView()
    let botaoHome = UIButton()
    let msgArraste = UIImageView()
    
    private var chompPlayer: AVAudioPlayer?
    
    //let framePresente = UIPanGestureRecognizer(target: self, action: #selector(xxx))
    // presente1.addGestureRecognizer(framePresente)
    
    
    @objc func tocarBotaoHome() {
        print("foi para a home")
        let novaViewController = buscandoTemplo()
        show(novaViewController, sender: nil)
    }
    
    //fazer funcao de clicar no presente1 e ele ir crescendo tipo animação
    //fazwe a funcao do presente2 para
    
    override public func loadView(){
        
        
        
        
        
        let viewTemplo = UIView()
        self.view = viewTemplo
        
        backgroundTemplo.image = UIImage(named: "backgroundTemplo")
        backgroundTemplo.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        confete.image = UIImage(named: "confetee")
        confete.frame = CGRect(x: 29422, y: 141, width: 1440, height: 900)
        
        boop.image = UIImage(named: "boop")
        boop.frame = CGRect(x: 386, y: 620, width: 210, height: 221)
        //
        //        presente1.setBackgroundImage(UIImage(named: "presente"), for: .normal)
        //        presente1.frame = CGRect(x: 1308, y: 728, width: 83, height: 83)
        //        self.presente1.isHidden = false
        //
        
        
        msgArraste.image = UIImage(named: "arrastePresente")
        msgArraste.frame = CGRect(x: 758, y: 728, width: 294, height: 94)
        self.msgArraste.isHidden = false
        
        quadro.image = UIImage(named: "quadro")
        quadro.frame = CGRect(x: 553, y: 123, width: 421, height: 504)
        self.quadro.isHidden = true
        
        botaoHome.setBackgroundImage(UIImage(named: "voltarChina"), for: .normal)
        botaoHome.frame = CGRect(x: 15, y: 14, width: 114, height: 107)
        
        
        viewTemplo.addSubview(backgroundTemplo)
        viewTemplo.addSubview(confete)
        viewTemplo.addSubview(boop)
        // viewTemplo.addSubview(presente1)
        viewTemplo.addSubview(quadro)
        viewTemplo.addSubview(botaoHome)
        
        botaoHome.addTarget(self, action: #selector(OnboardingChina.tocarBotaoHome), for: .touchUpInside)
        
        //: Definimos nossa imagem de macaco que irá receber o gesto:
        let presente = UIImage(named: "presente")
        let presenteView = UIImageView(image: presente)
        presenteView.frame = CGRect(x: 1308, y: 728, width: 83, height: 83)
        view.addSubview(presenteView)
        
        //: E para adicionar o gesto de toque na `monkeyView`:
        //: 1. Primeiro precisamos ativar as interações do usuário
        presenteView.isUserInteractionEnabled = true
        //: 2. Criamos o reconhecedor de toque e adicionamos em `monkeyView`
        let tapPresente = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        //: 3. Adicionamos o reconhecedor de toque em `monkeyView`
        presenteView.addGestureRecognizer(tapPresente)
        
        //: Finalizamos com as devidas configurações da view no viewController
        self.view = view
        
        //: E agora precisamos implementar a funções de toque:
//        func handleTap(_ gesture: UIGestureRecognizer) {
//            print("Presente foi tocado!")
//        }
//
        let frame = UIImage(named: "transparente")
        let frameView = UIImageView(image: frame)
        frameView.frame = CGRect(x: 435, y: 728, width: 160, height: 129)
        view.addSubview(frameView)
        frameView.isUserInteractionEnabled = true
        let panFrame = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        presenteView.addGestureRecognizer(panFrame)
        
        self.view = view
        
        let imageViews = view.subviews.filter {
            $0 is UIImageView
        }
        
        for imageView in imageViews {
            //: Criar um UITapGestureRecognizer para cada UIImageView, especificando o retorno da chamada para `handleTapForSound`
            let tapGesture = UITapGestureRecognizer(
                target: self,
                action: #selector(handleTapForSound)
            )
            //: Adicionar gesto a UIImageView.
            imageView.addGestureRecognizer(tapGesture)
        }
        chompPlayer = createPlayer(from: "laugh", with: "caf")
    }
    //: Criar `handleTapForSound` para iniciar a música sempre que alguma imagem for tocada
    @objc func handleTapForSound() {
        chompPlayer?.play()
    }
    
    //: Implementar método que cria o player
    func createPlayer(from filename: String, with fileExtension: String) -> AVAudioPlayer? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            return nil
        }
        var player = AVAudioPlayer()
        
        do {
            try player = AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch {
            print("Error loading \(url.absoluteString): \(error)")
        }
        
        return player
    }
    
    //: E implementar o restante que havia no nosso arquivo:
//    @objc func handleTap(_ gesture: UIGestureRecognizer) {
//        print("Macaco foi tocado!")
//    }
//
//    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
//        let translation = gesture.translation(in: view)
//        guard let gestureView = gesture.view else {
//            return
//        }
//
//        gestureView.center = CGPoint(
//            x: gestureView.center.x + translation.x,
//            y: gestureView.center.y + translation.y
//        )
//
//        gesture.setTranslation(.zero, in: view)
//    }
    
    @objc func handleTap(_ gesture: UIGestureRecognizer) {
        print("Presente foi tocado!")
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        
        print("handlePan")
        // 1
        let translation = gesture.translation(in: view)
        
        // 2
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )
        // 3
        gesture.setTranslation(.zero, in: view)
    }
    
}
