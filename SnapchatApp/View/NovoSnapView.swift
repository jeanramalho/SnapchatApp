//
//  NovoSnapView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 03/04/25.
//
import Foundation
import UIKit

class NovoSnapView: UIView {
    
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
        
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
