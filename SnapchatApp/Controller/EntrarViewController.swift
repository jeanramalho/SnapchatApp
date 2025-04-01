//
//  EntrarViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit

class EntrarViewController: UIViewController {
    
    private let contentView: EntrarView = EntrarView()
    
    private let verSenhaButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupContentView(){
        
        verSenhaButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        
        let senhaTextFiel = contentView.senhaTextFiel
        
        senhaTextFiel.rightView = verSenhaButton
        senhaTextFiel.rightViewMode = .always
        
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc private func showPassword(_ sender: UIButton){
        
        let senhaTextFiel = contentView.senhaTextFiel
        
        senhaTextFiel.isSecureTextEntry.toggle()
       
        let imageName = senhaTextFiel.isSecureTextEntry ? "eye.slash" : "eye"
        
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
