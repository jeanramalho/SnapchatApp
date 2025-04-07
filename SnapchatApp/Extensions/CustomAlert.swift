//
//  CustomAlert.swift
//  SnapchatApp
//
//  Created by Jean Ramalho on 07/04/25.
//
import Foundation
import UIKit

class CustomAlert {
    
    var titulo: String
    var mensagem: String
    
    init(titulo: String, mensagem: String) {
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlerta() -> UIAlertController {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
        return alerta
    }
}
