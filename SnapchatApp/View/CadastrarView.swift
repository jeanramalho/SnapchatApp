//
//  CadastrarView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit

class CadastrarView: UIView {
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Email:"
        label.tintColor = .darkGray
        return label
    }()
    
    lazy var senhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Senha:"
        label.tintColor = .darkGray
        return label
    }()
    
    lazy var confirmarSenhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "Confirmar senha:"
        label.tintColor = .darkGray
        return label
    }()
    
    lazy var emailTextFiel: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Digite seu email..."
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    lazy var senhaTextFiel: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Digite sua senha..."
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 6
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var confirmaSenhaTextFiel: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = " Confirme sua senha..."
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 6
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var cadastrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var mainCadastroStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(mainCadastroStackView)
        
        mainCadastroStackView.addArrangedSubview(emailLabel)
        mainCadastroStackView.addArrangedSubview(emailTextFiel)
        mainCadastroStackView.addArrangedSubview(senhaLabel)
        mainCadastroStackView.addArrangedSubview(senhaTextFiel)
        mainCadastroStackView.addArrangedSubview(confirmarSenhaLabel)
        mainCadastroStackView.addArrangedSubview(confirmaSenhaTextFiel)
        mainCadastroStackView.addArrangedSubview(cadastrarButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            mainCadastroStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            mainCadastroStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            mainCadastroStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            emailTextFiel.heightAnchor.constraint(equalToConstant: 40),
            
            senhaTextFiel.heightAnchor.constraint(equalToConstant: 40),
            
            confirmaSenhaTextFiel.heightAnchor.constraint(equalToConstant: 40),
            
            cadastrarButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
