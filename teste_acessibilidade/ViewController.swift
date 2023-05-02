//
//  ViewController.swift
//  teste_acessibilidade
//
//  Created by Rodolfo on 08/02/23.
//

enum Teste: Equatable {
    case success
    case error(message: String?, button: String? = nil)
}

enum Map: String, CaseIterable {
    case teste1 = "teste 1"
    case teste2 = "teste 2"
}

enum Map2: String, CaseIterable {
    case teste3 = "teste 3"
    case teste4 = "teste 4"
}

enum Map3: String, RawRepresentable {
    case teste5 = "teste 4"
    case teste6 = "teste 5"
    case unknown
}


import UIKit

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let lab = UILabel()
        lab.text = "Avenue e grande merda no core"
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //        teste(aaa: .error(message: "merda"))
        let sss = Map3(rawValue: "merda") ?? .unknown
        testeEnum(texto: "teste 3")
        outroteste(map: sss)
    }
    
    func teste(aaa: Teste) {
        switch aaa {
        case .error(message: let fff):
            print(fff.message ?? "vazio")
        default:
            break
        }
    }
    
    private func setupUI() {
        view.addSubview(stack)
        stack.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        label.setAcessibilityValueWithForeignSpeech(value: "Bank of america e grande merda no core")
    }
    
    
    func testeEnum(texto: String) {
        switch texto {
        case _ where Map(rawValue: texto) != nil:
            print("O texto é igual a algum caso do enum Map")
        case _ where Map2(rawValue: texto) != nil:
            print("O texto é igual a algum caso do enum Map2")
        default:
            print("O texto não é igual a nenhum caso de nenhum dos enums")
        }
    }
    
    func outroteste(map: Map3) {
        switch map {
        case .teste5:
            print("teste5")
        case .teste6:
            print("teste6")
        default:
            print("OUtro")
        }
    }
    
}

