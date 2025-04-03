//
//  NovoSnapView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 03/04/25.
//
import Foundation
import UIKit

class NovoSnapView: UIView {
    
    lazy var novoSnapStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var snapImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "padrao")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var descriptionTextFiel: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua legenda..."
        textField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 6
        return textField
    }()
    
    lazy var proximoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Próximo", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        return button
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
        
        addSubview(novoSnapStackView)
        
        novoSnapStackView.addArrangedSubview(snapImageView)
        novoSnapStackView.addArrangedSubview(descriptionTextFiel)
        novoSnapStackView.addArrangedSubview(proximoButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            novoSnapStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
            novoSnapStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            novoSnapStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            snapImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            descriptionTextFiel.heightAnchor.constraint(equalToConstant: 40),
            descriptionTextFiel.widthAnchor.constraint(equalTo: novoSnapStackView.widthAnchor),
            
            proximoButton.heightAnchor.constraint(equalToConstant: 40),
            proximoButton.widthAnchor.constraint(equalTo: novoSnapStackView.widthAnchor),
            
        ])
    }
}
