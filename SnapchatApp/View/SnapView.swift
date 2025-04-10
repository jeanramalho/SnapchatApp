//
//  SnapView.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 10/04/25.
//
import Foundation
import UIKit

class SnapView: UIView {
    
    lazy var legendAndTimerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var snapImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var legendLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.shadowRadius = 3
        label.layer.shadowOpacity = 0.7
        label.layer.masksToBounds = false
        return label
    }()
    
    lazy var circleCounter: CircularTimerView = {
        let counter = CircularTimerView()
        counter.translatesAutoresizingMaskIntoConstraints = false
        return counter
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .black
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
        addSubview(snapImageView)
        addSubview(legendAndTimerStackView)
        
        legendAndTimerStackView.addArrangedSubview(legendLabel)
        legendAndTimerStackView.addArrangedSubview(circleCounter)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            snapImageView.topAnchor.constraint(equalTo: topAnchor),
            snapImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            snapImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            snapImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            legendAndTimerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            legendAndTimerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            legendAndTimerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            
            circleCounter.heightAnchor.constraint(equalToConstant: 80),
            circleCounter.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
