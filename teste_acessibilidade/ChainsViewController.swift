//
//  ChainsViewController.swift
//  teste_acessibilidade
//
//  Created by Rodolfo on 14/03/23.
//

import UIKit

class ChainsViewController: UIViewController {

    let letters = Array("🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗🔗")

    var enabled = false
    var dragAmount = CGSize.zero
    var labels = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        for index in 0..<letters.count {
            let label = UILabel()
            label.text = String(letters[index])
            label.font = UIFont.systemFont(ofSize: 80)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(label)

            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
            label.heightAnchor.constraint(equalToConstant: 100).isActive = true
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(index * 110) + 50).isActive = true

            labels.append(label)
        }

        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        view.addGestureRecognizer(gesture)
    }

    @objc func handleGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)

        for labelIndex in 0..<letters.count {
            let label = labels[labelIndex]
            label.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
            label.transform = label.transform.rotated(by: enabled ? 0 : CGFloat.pi * 2)
            let delay = Double(labelIndex) / 20
            UIView.animate(withDuration: 2.0, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1, options: [], animations: {
                label.transform = .identity
            }, completion: nil)
        }

        if gesture.state == .ended {
            dragAmount = .zero
            enabled.toggle()
        }
    }
}
