//
//  EntrarViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit
import FirebaseAuth

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
        
        setupNavigationBar()
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupContentView(){
        
        verSenhaButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        
        let senhaTextFiel = contentView.senhaTextFiel
        let entrarButton = contentView.entrarButton
        
        entrarButton.addTarget(self, action: #selector(showHomeView), for: .touchUpInside)
        
        senhaTextFiel.rightView = verSenhaButton
        senhaTextFiel.rightViewMode = .always
        
    }
    
    private func setupNavigationBar(){
        
        self.title = "Fazer Login"
            
            if let navigationbar = navigationController?.navigationBar {
                
                let navigationBarLayout = UINavigationBarAppearance()
                navigationBarLayout.configureWithOpaqueBackground()
                navigationBarLayout.backgroundColor = .clear
                
                let fontAttributes = [
                    NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .medium)
                ]
                
                navigationBarLayout.titleTextAttributes = fontAttributes
                
                navigationbar.standardAppearance = navigationBarLayout
                navigationbar.scrollEdgeAppearance = navigationBarLayout
                navigationbar.compactAppearance = navigationBarLayout
                
                navigationbar.tintColor = .systemBlue
            }
            
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
    
    private func alertMessage(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func showPassword(_ sender: UIButton){
        
        let senhaTextFiel = contentView.senhaTextFiel
        
        senhaTextFiel.isSecureTextEntry.toggle()
       
        let imageName = senhaTextFiel.isSecureTextEntry ? "eye.slash" : "eye"
        
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func showHomeView(){
        
        let homeViewController = HomeViewController()
        
        if let email = contentView.emailTextFiel.text,
           let senha = contentView.senhaTextFiel.text {
            
            if email == "" || senha == "" {
                
                alertMessage(title: "Preencha todos os dados!", message: "Os campos de email e senha devem ser preenchidos corretamente para fazer login!")
            }
            
            // Autentica usuário no firebase
            let autenticacao = Auth.auth()
            
            autenticacao.signIn(withEmail: email, password: senha) { user, error in
                
                if error == nil {
                    
                    if user == nil {
                        
                        self.alertMessage(title: "Usuário não encontrado!", message: "Tente novamente com um usuário válido!")
                        
                    } else {
                
                            self.navigationController?.setViewControllers([homeViewController], animated: true)
                        
                    }
                    
                } else {
                    self.alertMessage(title: "Dados incorretos!", message: "Preencha os dados corretamente para fazer login!")
                    print("Erros incorretos!")
                }
            }
            
            
        } else {
            print("Erro ao tentar recuperar os dados")
        }
        
    }
}
