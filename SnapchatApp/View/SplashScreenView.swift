//
//  SplashScreenView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 31/03/25.
//
import Foundation
import UIKit

class SplashScreenView: UIView {
    
    lazy var logoSplashScreenImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .yellow
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(logoSplashScreenImageView)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            logoSplashScreenImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoSplashScreenImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoSplashScreenImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
        ])
    }
}
