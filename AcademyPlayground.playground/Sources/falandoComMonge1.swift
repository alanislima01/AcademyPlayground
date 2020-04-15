import UIKit

public class FalandoComMonge: UIViewController{
    
    let fontURL = Bundle.main.url(forResource: "Nunito-Regular", withExtension: "ttf")! as CFURL
    
    let fundoMonge = UIImageView()
    let monge = UIImageView()
    let boopCalado = UIImageView()
    let passaros = UIImageView()
    let fraseExplicando = UIImageView()
    let balaoMonge = UIImageView()
    let balaoBoop = UIImageView()
    let botaoVoltarChina = UIButton()
    
    let botao1 = UIButton()
    let botao2 = UIButton()
    let botao3 = UIButton()
    
    let falaCumprimentar = UILabel()
    let falaMonge = UILabel()
    
    let botaoProximo =  UIButton()
    let botaoVoltar = UIButton()
    var botaoPressionado: Int = 0
    
    var dialogoEncerrado: Bool = false
    
    var acaoSelecionada: AcaoBoop = AcaoBoop(titulo: "", falaBoop: "", falaMonge: "")
    
    var acoesBoop: [AcaoBoop] = [AcaoBoop(titulo:"Cumprimentar", falaBoop: "Olá, sou Boop. Está tudo bem? Vi você aqui em cima dessa montanha sozinho e queria sabe se está tudo bem..." ,falaMonge:  "Olá Boop! Está tudo bem sim, estou sozinho porque eu estava meditando."),
                                 AcaoBoop(titulo:"Perguntar o porque ele é careca",falaBoop:  "Não queria ser chato, mas fiquei curioso de saber por que o senhor não tem cabelo!" ,falaMonge:  "Para entender sobre isso, seria legal eu te contar a história de como surgiu o budismo. Você gostaria de aprender?"),
                                 AcaoBoop(titulo: "O que é budismo?", falaBoop: "Gostaria muito de saber o que é o budismo, senhor monge!" , falaMonge: "Vou contar! A muitos anos atrás, existia um principe chamado Sidarta. Ele vivia em um palácio gigante e bonito, mas mesmo assim não estava satisfeito! E MUITO MAIS"),
                                 AcaoBoop(titulo: "Para onde vamos?", falaBoop: "Você sabe um próximo lugar que posso explorar? Estou procurando um presente!" , falaMonge: "Sim! Você pode conhecer melhor o templo budista aqui perto. É parecida com uma casa grande e vermelha!")]
    
    
    @IBAction func escolherOpcao(sender: UIButton){
        
        if sender == botao1 {
            acaoSelecionada = acoesBoop[0]
            acoesBoop.remove(at: 0)
        } else if sender == botao2 {
            acaoSelecionada = acoesBoop[1]
            acoesBoop.remove(at: 1)
        }else if sender == botao3 {
            acaoSelecionada = acoesBoop[2]
            acoesBoop.remove(at: 2)
        }
        
        botao1.isHidden = true
        botao2.isHidden = true
        botao3.isHidden = true
        
        falaCumprimentar.isHidden = false
        falaCumprimentar.text = acaoSelecionada.falaBoop
        balaoBoop.isHidden = false
        
        botaoProximo.isHidden = false
        
    }
    
    @IBAction func tocarProximo() {
        
        if dialogoEncerrado{
            print( "mudar view controller")
            let novaViewController = buscandoTemplo(screenType: .mac , isPortrait: true)
            navigationController?.pushViewController(novaViewController, animated: false)
        }
        else if falaMonge.isHidden{
            falaCumprimentar.isHidden = true
            falaMonge.isHidden = false
            falaMonge.text = acaoSelecionada.falaMonge
            self.botaoVoltar.isHidden = false
            self.balaoMonge.isHidden = false
            self.balaoBoop.isHidden = true
        }else {
            self.balaoMonge.isHidden = true
            self.balaoBoop.isHidden = false
            exibirOpcoes()
        }
        
    }
    
    @IBAction func tocarVoltar() {
        if falaMonge.isHidden{
            falaCumprimentar.isHidden = true
            falaMonge.isHidden = false
            falaMonge.text = acaoSelecionada.falaMonge
            self.botaoVoltar.isHidden = false
            self.balaoMonge.isHidden = false
            self.balaoBoop.isHidden = true
        }else{
            self.balaoMonge.isHidden = true
            self.balaoBoop.isHidden = false
            falaCumprimentar.text = acaoSelecionada.falaBoop
            falaMonge.isHidden = true
            falaCumprimentar.isHidden = false
        }
        
    }
    
    @IBAction func tocarBotaoVoltarTudo() {
        print("foi para a casa")
        let novaViewController = OnboardingChina()
        show(novaViewController, sender: nil)
        //self.explicacaoChina.isHidden = true
        //superBotao.isHidden = true
        //
    }
    
    override public func loadView(){
        
        let viewChina = UIView()
        self.view = viewChina
        
        CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)

        
        fundoMonge.image = UIImage(named: "fundoMonge")
        fundoMonge.frame = CGRect(x: 0, y: 0, width: 1440, height: 900)
        
        monge.image = UIImage(named: "monge")
        monge.frame = CGRect(x: 1085, y: 172, width: 287, height: 356)
        
        boopCalado.image = UIImage(named: "boopCalado")
        boopCalado.frame = CGRect(x: 426, y: 380, width: 211, height: 221)
        
        passaros.image = UIImage(named: "passaros")
        passaros.frame = CGRect(x: 15, y: -28, width: 564, height: 390)
        
        fraseExplicando.image = UIImage(named: "oqBoopVaiFzr")
        fraseExplicando.frame = CGRect(x: 515, y: 656, width: 499, height: 150)
        //colcoar TIMER AQ
        
        botaoVoltarChina.frame = CGRect(x: 973, y: 504, width: 278, height: 93)
        botaoVoltarChina.setBackgroundImage(UIImage(named: "botaoEsquerdo"), for: .normal)
        
        botao1.frame = CGRect(x: 532, y: 39, width: 447, height: 93)
        botao1.isHidden = false
        botao1.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.4745098039, blue: 0.4745098039, alpha: 1)
        botao1.layer.cornerRadius = 20
        botao1.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 50)

        
        botao2.frame = CGRect(x: 528, y: 149, width: 447, height: 93)
        botao2.isHidden = false
        botao2.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.4745098039, blue: 0.4745098039, alpha: 1)
        botao2.layer.cornerRadius = 20
        botao2.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 50)

        
        botao3.frame = CGRect(x: 528, y: 259, width: 447, height: 93)
        botao3.isHidden = false
        botao3.backgroundColor = #colorLiteral(red: 0.9747982621, green: 0.4747188687, blue: 0.4712342024, alpha: 1)
        botao3.layer.cornerRadius = 20
        botao3.titleLabel?.font = UIFont(name: "Nunito-Regular", size: 50)

        falaCumprimentar.frame = CGRect(x: 448, y: 124, width: 571, height: 131)
        falaCumprimentar.isHidden = true
        falaCumprimentar.numberOfLines = 0
        falaCumprimentar.font = UIFont(name: "Nunito-Regular", size: 30)//size é tamanho
        //falaCumprimentar.font = UIFont
        
        falaMonge.frame = CGRect(x: 409, y: 90, width: 610, height: 225)
        falaMonge.isHidden = true
        falaMonge.numberOfLines = 0
        falaMonge.font = UIFont(name: "Nunito-Regular", size: 30)//size é tamanho
        
        
        //monge
        
        
        botaoProximo.setBackgroundImage(UIImage(named: "setaDireita"), for: .normal)
        botaoProximo.frame = CGRect(x: 845, y: 309, width: 71, height: 66)
        botaoProximo.tag = 1
        botaoProximo.isHidden = true
        
        
        botaoVoltar.setBackgroundImage(UIImage(named: "botaoEsquerdo"), for: .normal)
        botaoVoltar.frame = CGRect(x: 700, y: 309, width: 71, height: 66)
        botaoVoltar.tag = 0
        botaoVoltar.isHidden = true
        
        botaoVoltarChina.setBackgroundImage(UIImage(named: "voltarChina"), for: .normal)
        botaoVoltarChina.frame = CGRect(x: 17, y: 17, width: 114, height: 107)
        
        balaoBoop.image = UIImage(named: "balaoBoop")
        balaoBoop.frame = CGRect(x: 409, y: 90, width: 610, height: 225)
        balaoBoop.isHidden = true
        
        balaoMonge.image = UIImage(named: "balaoMonge")
        balaoMonge.frame = CGRect(x: 602, y: 74, width: 577, height: 196)
        balaoMonge.isHidden = true
        
        
        viewChina.addSubview(fundoMonge)
        viewChina.addSubview(passaros)
        viewChina.addSubview(fraseExplicando)
        viewChina.addSubview(monge)
        viewChina.addSubview(boopCalado)
        viewChina.addSubview(botaoVoltarChina)
        viewChina.addSubview(balaoBoop)
        viewChina.addSubview(balaoMonge)
        viewChina.addSubview(botao1)
        viewChina.addSubview(botao2)
        viewChina.addSubview(botao3)
        viewChina.addSubview(falaCumprimentar)
        viewChina.addSubview(falaMonge)
        viewChina.addSubview(botaoProximo)
        viewChina.addSubview(botaoVoltar)
        
        
        
        
        botao1.addTarget(self, action: #selector(FalandoComMonge.escolherOpcao), for: .touchUpInside)
        botao2.addTarget(self, action: #selector(FalandoComMonge.escolherOpcao), for: .touchUpInside)
        botao3.addTarget(self, action: #selector(FalandoComMonge.escolherOpcao), for: .touchUpInside)
        botaoVoltarChina.addTarget(self, action: #selector(FalandoComMonge.tocarBotaoVoltarTudo), for: .touchUpInside)
        
        botaoProximo.addTarget(self, action: #selector(FalandoComMonge.tocarProximo), for: .touchUpInside)
        botaoVoltar.addTarget(self, action: #selector(FalandoComMonge.tocarVoltar), for: .touchUpInside)
        
        exibirOpcoes()
        
    }
    
    func encerrar(){
        balaoBoop.isHidden = true
        balaoMonge.isHidden = false
        falaMonge.text = "texto despedida"
        dialogoEncerrado = true
        
    }
    
    func exibirOpcoes(){
        
        if acoesBoop.count == 0{
            encerrar()
        }else {
            botao1.setTitle(acoesBoop[0].titulo,for: .normal)
            botao1.isHidden = false
            if acoesBoop.count >= 2{
                botao2.setTitle(acoesBoop[1].titulo,for: .normal)
                botao2.isHidden = false
            }
            if acoesBoop.count >= 3{
                botao3.setTitle(acoesBoop[2].titulo,for: .normal)
                botao3.isHidden = false
            }
            
            botaoProximo.isHidden = true
            botaoVoltar.isHidden = true
            falaMonge.isHidden = true
            balaoBoop.isHidden = true
            balaoMonge.isHidden = true
            

            
        }
    }
}


public class AcaoBoop{
    
    var titulo: String
    var falaBoop: String
    var falaMonge: String
    
    
    init(titulo:String, falaBoop:String, falaMonge:String){
        
        self.titulo = titulo
        self.falaBoop = falaBoop
        self.falaMonge = falaMonge
        
    }
    
}
