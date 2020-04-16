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
    let msgQuadro = UIImageView()
    
    private var chompPlayer: AVAudioPlayer?
    
    //let framePresente = UIPanGestureRecognizer(target: self, action: #selector(xxx))
    // presente1.addGestureRecognizer(framePresente)
    
    
    @objc func tocarBotaoHome() {
        print("foi para a home")
        let novaViewController = buscandoTemplo()
        show(novaViewController, sender: nil)
    }
    
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        
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
        
    let frame2 = CGRect(x: 435, y: 728, width: 165, height: 135)
        if gesture.state == .ended{
            if frame2.contains(gestureView.frame){
            self.confete.isHidden = false
                self.quadro.isHidden = false
                self.msgArraste.isHidden = true
                self.msgQuadro.isHidden = false
            }else{
            gestureView.center = .init(x: 1308, y: 728)
            }
    }
}
    
    
    
    override public func loadView(){
        
        let viewTemplo = UIView()
        self.view = viewTemplo
        
        backgroundTemplo.image = UIImage(named: "backgroundTemplo")
        backgroundTemplo.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        confete.image = UIImage(named: "confetee")
        confete.frame = CGRect(x: -87, y: -171, width: 1600, height: 1177)
        self.confete.isHidden = true
        
        boop.image = UIImage(named: "boop")
        boop.frame = CGRect(x: 386, y: 620, width: 210, height: 221)

        msgArraste.image = UIImage(named: "arrastePresente")
        msgArraste.frame = CGRect(x: 758, y: 728, width: 294, height: 94)
        self.msgArraste.isHidden = false
        
        msgQuadro.image = UIImage(named: "msgQuadro")
        msgQuadro.frame = CGRect(x: 589, y: 157, width: 340, height: 176)
        self.msgQuadro.isHidden = true
        
        quadro.image = UIImage(named: "quadro")
        quadro.frame = CGRect(x: 658, y: 434, width: 195, height: 233)
        self.quadro.isHidden = true
        
        botaoHome.setBackgroundImage(UIImage(named: "voltarChina"), for: .normal)
        botaoHome.frame = CGRect(x: 15, y: 14, width: 114, height: 107)
        
        
        viewTemplo.addSubview(backgroundTemplo)
        viewTemplo.addSubview(confete)
        viewTemplo.addSubview(boop)
        // viewTemplo.addSubview(presente1)
        viewTemplo.addSubview(quadro)
        viewTemplo.addSubview(botaoHome)
        viewTemplo.addSubview(msgArraste)
        viewTemplo.addSubview(msgQuadro)
        
        
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
    
    @objc func handleTap(_ gesture: UIGestureRecognizer) {
        print("Presente foi tocado!")
    }
    

}

