//
//  EntrarView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 01/04/25.
//
import Foundation
import UIKit

class EntrarView: UIView {
    
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
    
    
    lazy var emailTextFiel: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu email..."
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    lazy var senhaTextFiel: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha..."
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    
    lazy var entrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        return button
    }()
    
    lazy var mainEntrarStackView: UIStackView = {
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
        
        addSubview(mainEntrarStackView)
        
        mainEntrarStackView.addArrangedSubview(emailLabel)
        mainEntrarStackView.addArrangedSubview(emailTextFiel)
        mainEntrarStackView.addArrangedSubview(senhaLabel)
        mainEntrarStackView.addArrangedSubview(senhaTextFiel)
        mainEntrarStackView.addArrangedSubview(entrarButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            mainEntrarStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            mainEntrarStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            mainEntrarStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            emailTextFiel.heightAnchor.constraint(equalToConstant: 40),
            
            senhaTextFiel.heightAnchor.constraint(equalToConstant: 40),
            
            entrarButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
