# 📱 SnapchatApp

![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Platform](https://img.shields.io/badge/Platform-iOS-blue)
![Firebase](https://img.shields.io/badge/Firebase-Database-yellow)
![ViewCode](https://img.shields.io/badge/Layout-ViewCode-green)

> Uma versão pessoal do Snapchat desenvolvida para estudo e aprimoramento de habilidades em desenvolvimento iOS nativo.

## 🔍 Visão Geral

Este projeto é uma recriação do Snapchat com foco no aprendizado e aplicação de conceitos avançados de desenvolvimento iOS. Construído inteiramente com Swift e ViewCode (sem Storyboard), o app implementa um sistema completo de compartilhamento de fotos temporárias entre usuários, semelhante ao Snapchat original.

## ✨ Funcionalidades

- **🔐 Autenticação Completa**: Sistema de login e cadastro de usuários
- **📋 Listagem de Snaps**: Visualização de snaps recebidos de outros usuários
- **📸 Captura de Fotos**: Interface para tirar fotos e adicionar legendas
- **👥 Gerenciamento de Usuários**: Listagem de usuários disponíveis para envio de snaps
- **☁️ Persistência de Dados**: Integração com Firebase para armazenamento em tempo real

## 🛠️ Tecnologias Aplicadas

- **Swift 5**: Linguagem principal de desenvolvimento
- **UIKit**: Framework para construção de interfaces
- **ViewCode**: Abordagem programática para construção de layouts (sem Storyboard)
- **Firebase**: Backend como serviço para autenticação e armazenamento de dados
- **SPM (Swift Package Manager)**: Gerenciamento de dependências
- **MVC**: Arquitetura de desenvolvimento utilizada no projeto

## 📂 Estrutura do Projeto

O projeto foi estruturado seguindo padrões de organização que facilitam a manutenção e escalabilidade:

```
SnapchatApp/
├── Controllers/    # Controladores de cada tela
├── Models/         # Modelos de dados da aplicação
├── Views/          # Componentes de interface
├── Services/       # Serviços de integração com Firebase
└── Utils/          # Utilitários e extensões
```

## 📱 Telas Principais

### Login e Cadastro
- Autenticação segura com Firebase
- Validação de dados em tempo real
- Transições suaves entre telas

### Feed de Snaps
- Lista de snaps recebidos
- Indicadores visuais de status
- Animações de carregamento

### Criação de Snaps
- Interface intuitiva para captura de fotos
- Adição de legendas personalizadas
- Seleção de destinatários

### Lista de Usuários
- Exibição de todos os usuários cadastrados
- Busca e filtragem
- Seleção múltipla para envio de snaps

## 💡 Conceitos Explorados

- **Programação Orientada a Protocolos**
- **Gerenciamento de Ciclo de Vida (Lifecycle)**
- **Delegates e Datasources**
- **Gerenciamento de Memória**
- **Tratamento de Requisições Assíncronas**
- **Persistência de Dados**
- **Manipulação de Imagens**
- **Animações UIKit**

## 🎯 Objetivos do Projeto

Este projeto foi desenvolvido como parte do meu processo de aprendizado contínuo em desenvolvimento iOS, com foco em:

1. Aprofundar conhecimentos em Swift e UIKit
2. Praticar a construção de interfaces sem Storyboard (ViewCode)
3. Implementar integrações com serviços de backend (Firebase)
4. Desenvolver habilidades em arquitetura de software móvel
5. Simular um ambiente de produção com features completas

## 🚀 Como Executar

1. Clone o repositório
```bash
git clone https://github.com/jeanramalho/SnapchatApp.git
```

2. Instale as dependências via Swift Package Manager
```bash
cd SnapchatApp
swift package resolve
```

3. Abra o arquivo `.xcodeproj` no Xcode

4. Configure seu próprio arquivo `GoogleService-Info.plist` com suas credenciais do Firebase

5. Execute o projeto no simulador ou dispositivo físico

## 📞 Contato

Sinta-se à vontade para entrar em contato comigo para discutir sobre o projeto, sugestões ou oportunidades:

- LinkedIn: [Jean Ramalho](https://www.linkedin.com/in/jeanramalho)
- Email: [seu-email@exemplo.com]

---

⭐️ Desenvolvido por Jean Ramalho como projeto de estudo e portfólio para demonstração de habilidades em desenvolvimento iOS nativo.
