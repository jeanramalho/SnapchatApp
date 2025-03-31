//
//  LoginView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 31/03/25.
//
import Foundation
import UIKit

class SnapchatLoginView: UIView {
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var cadastrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        return button
    }()
    
    lazy var entrarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        button.backgroundColor = .red
        button.tintColor = .white
        return button
    }()
    
    lazy var logoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
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
        
        backgroundColor = .green
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(logoView)
        addSubview(buttonStackView)
        
        logoView.addSubview(logoImageView)
        
        buttonStackView.addArrangedSubview(entrarButton)
        buttonStackView.addArrangedSubview(cadastrarButton)
        
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            logoView.topAnchor.constraint(equalTo: topAnchor),
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            
            logoImageView.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),
            logoImageView.heightAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 0.2),
            
            buttonStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
}
