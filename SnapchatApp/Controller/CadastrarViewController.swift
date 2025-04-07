//
//  CadastrarViewController.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

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
        
        setupNavigationBar()
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupContentView(){
        
        let senhaTextFiel = contentView.senhaTextFiel
        let confirmaSenhaTextFiel = contentView.confirmaSenhaTextFiel
        let cadastrarButton = contentView.cadastrarButton
        
        verSenhaButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        verConfirmarSenhaButton.addTarget(self, action: #selector(showConfirmPassword), for: .touchUpInside)
        
        cadastrarButton.addTarget(self, action: #selector(salvaUsuario), for: .touchUpInside)
        
        senhaTextFiel.rightView = verSenhaButton
        senhaTextFiel.rightViewMode = .always
        
        confirmaSenhaTextFiel.rightView = verConfirmarSenhaButton
        confirmaSenhaTextFiel.rightViewMode = .always
        
        
    }
    
    private func setupNavigationBar(){
        
        self.title = "Cadastra-se"
        
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
    
    @objc private func showConfirmPassword(_ sender: UIButton) {
        
        let confirmaSenhaTextFiel = contentView.confirmaSenhaTextFiel
        
        confirmaSenhaTextFiel.isSecureTextEntry.toggle()
        
        let imageName = confirmaSenhaTextFiel.isSecureTextEntry ? "eye.slash" : "eye"
        
        sender.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc private func salvaUsuario() {
        
        // tenta recuperar dados digitados
        if let userEmail = contentView.emailTextFiel.text,
           let nomeCompleto = contentView.nomeCompletoTextFiel.text,
           let userPassword = contentView.senhaTextFiel.text,
           let confirmUserPassword = contentView.confirmaSenhaTextFiel.text {
            
            // verifica se todos os campos estão preenchidos
            if userEmail == "" || nomeCompleto == "" || userPassword == "" || confirmUserPassword == "" {
                alertMessage(title: "Preencha todos os campos!", message: "Preencha todos os campos para criar sua conta!")
            }
            
            // Verificação de senha
            if userPassword == confirmUserPassword {
                
                // Cria novo usuário no firebase
                let autenticacao = Auth.auth()
                autenticacao.createUser(withEmail: userEmail, password: userPassword) { authResult, error in
                    
                    if error == nil {
                        
                        let dataBase = Database.database().reference()
                        let usuarios = dataBase.child("usuarios")
                        
                        // pega o id do usário criado
                        guard let userId = authResult?.user.uid else {return}
                        
                        // cria um objeto com os dados do usuário
                        let userData = ["nome": nomeCompleto, "email": userEmail]
                        
                        // salva dados do usuário fora da autenticacao do firebase
                        usuarios.child( userId ).setValue(userData) { error, _ in
                            
                            if let erro = error {
                                
                                self.alertMessage(title: "Erro ao criar usuário", message: "Ocorreu um erro ao criar o usuário. Porfavor tente novamente!")
                                
                                print("Erro ao criar usuário: \(erro.localizedDescription)")
                            } else {
                                
                                let homeViewController = HomeViewController()
                                
                                self.alertMessage(title: "Sucesso", message: "Usuário criado com sucesso!")
                                print("Usuario criado com sucesso")
                                
                                self.navigationController?.setViewControllers([homeViewController], animated: true)
                                
                            }
                            
                            
                        }
                        
                        
                        
                        
                    } else {
                        
                        guard let erroNS = error as? NSError else {return}
                        
                        if let nomeErro = erroNS.userInfo["FIRAuthErrorUserInfoNameKey"] {
                            
                            guard let textoDoErro = nomeErro as? String else {return}
                            var mensagemErro = ""
                            
                            switch textoDoErro {
                                
                            case "ERROR_INVALID_EMAIL" :
                                mensagemErro = "E-mail inválido, por favor digite um e-mail válido!"
                                break
                            case "ERROR_WEAK_PASSWORD" :
                                mensagemErro = "Senha precisa ter no mínimo 6 caracteres!"
                                break
                            case "ERROR_EMAIL_ALREADY_IN_USE" :
                                mensagemErro = "Email já está em uso, digite um email válido ou faça login com seu email!"
                                break
                            default:
                                mensagemErro = "Os dados digitados estão incorretos"
                            }
                            
                            self.alertMessage(title: "Dados incorretos!", message: mensagemErro)
                            
                        }
                        
                        print("Erro ao criar usuário: \(String(describing: error?.localizedDescription))")
                    }// fim da validacao de erro firebase
                }
                
            } else {
                
                alertMessage(title: "Senhas não correspondem!", message: "As senhas devem ser iguais. Por favor digite novamente!")
                
            } // fim da verificação de senha
        } else {
            
            print("Erro ao recuperar dados digitados!")
            
        } // fim da validação de recuperacao de dados digitados
    }
    
}

