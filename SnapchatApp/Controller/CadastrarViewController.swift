//
//  CadastrarViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit

class CadastrarViewController: UIViewController {
    
    private let contentView: CadastrarView = CadastrarView()
    
    private let verSenhaButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return button
    }()
    
    private let verConfirmarSenhaButton: UIButton = {
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
        verConfirmarSenhaButton.addTarget(self, action: #selector(showConfirmPassword), for: .touchUpInside)
        
        let senhaTextFiel = contentView.senhaTextFiel
        let confirmaSenhaTextFiel = contentView.confirmaSenhaTextFiel
        
        senhaTextFiel.rightView = verSenhaButton
        senhaTextFiel.rightViewMode = .always
        
        confirmaSenhaTextFiel.rightView = verConfirmarSenhaButton
        confirmaSenhaTextFiel.rightViewMode = .always
        
        
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
    
    @objc private func showConfirmPassword(_ sender: UIButton) {
        
        let confirmaSenhaTextFiel = contentView.confirmaSenhaTextFiel
        
        confirmaSenhaTextFiel.isSecureTextEntry.toggle()
        
        let imageName = confirmaSenhaTextFiel.isSecureTextEntry ? "eye.slash" : "eye"
        
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
