# 📱 SnapchatApp

![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Platform](https://img.shields.io/badge/Platform-iOS-blue)
![Firebase](https://img.shields.io/badge/Firebase-Database-yellow)
![ViewCode](https://img.shields.io/badge/Layout-ViewCode-green)
![Architecture](https://img.shields.io/badge/Architecture-MVC-red)

![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 10 04](https://github.com/user-attachments/assets/5718e765-b54a-4871-9acc-ddaf4fd4c062)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 10 12](https://github.com/user-attachments/assets/75bdd4c1-05b4-4b86-88ec-be1d3ae6262e)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 10 21](https://github.com/user-attachments/assets/686c4f57-c7e9-402e-922a-1af1bef70691)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 10 45](https://github.com/user-attachments/assets/79fa6f7a-2d12-4d95-b1bb-e123619a07cc)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 10 51](https://github.com/user-attachments/assets/e59428b0-09b8-49a6-bdf8-705bdedc8367)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 11 09](https://github.com/user-attachments/assets/051f0790-e685-4422-ba70-c2a29341e253)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 11 17](https://github.com/user-attachments/assets/e83b576a-9a57-4ac1-9392-e4be17fa6f33)
![Simulator Screenshot - Iphone 11 - 2025-04-10 at 14 11 51](https://github.com/user-attachments/assets/a0fa2563-ac12-47bc-ad69-d60648cc05f8)


> Uma reimaginação do Snapchat desenvolvida para aplicação e demonstração de conceitos avançados em desenvolvimento iOS nativo com ViewCode.

## 🔍 Visão Geral

Este projeto consiste em uma implementação personalizada do Snapchat, focada na aplicação prática de conceitos avançados de desenvolvimento iOS. Construído integralmente com Swift e ViewCode (zero Storyboard), o aplicativo apresenta um sistema completo de compartilhamento de imagens temporárias entre usuários, replicando as principais funcionalidades do app original.

## ✨ Funcionalidades Principais

- **🔐 Sistema de Autenticação**: Login e cadastro de usuários com validação em tempo real
- **📋 Feed de Snaps**: Visualização de snaps recebidos de contatos
- **📸 Captura de Imagens**: Interface para fotografar e adicionar legendas personalizadas
- **👥 Gerenciamento de Contatos**: Listagem de usuários disponíveis para troca de mensagens
- **☁️ Banco de Dados em Tempo Real**: Integração completa com Firebase para persistência de dados

## 🛠️ Stack Tecnológica

- **Swift 5**: Linguagem de programação nativa para iOS
- **UIKit**: Framework para desenvolvimento de interfaces robustas
- **ViewCode**: Abordagem programática para construção de layouts sem Storyboard
- **Firebase**: Plataforma de backend como serviço (BaaS) para autenticação e armazenamento
- **SPM (Swift Package Manager)**: Gerenciamento moderno de dependências
- **MVC**: Padrão arquitetural implementado para separação de responsabilidades

## 📂 Arquitetura do Projeto

O projeto foi estruturado seguindo o padrão MVC (Model-View-Controller) para garantir separação de responsabilidades, testabilidade e manutenibilidade:

```
SnapchatApp/
├── Models/       # Entidades e lógica de negócios
├── Views/        # Componentes de interface do usuário
├── Controllers/  # Coordenadores entre Models e Views
└── Extensions/   # Extensões de classes nativas do Swift/UIKit
```

## 📱 Fluxos de Usuário

### Autenticação
- Sistema seguro de login/cadastro via Firebase
- Persistência de sessão
- Validações e feedback em tempo real

### Visualização de Conteúdo
- Feed dinâmico de snaps recebidos
- Contador de visualizações
- Expiração automática de conteúdo

### Criação de Conteúdo
- Captura de fotos com acesso à câmera
- Editor de legendas com opções de formatação
- Seleção múltipla de destinatários

### Gerenciamento de Usuários
- Listagem otimizada de usuários da plataforma
- Interface de seleção intuitiva
- Gerenciamento de permissões

## 💡 Conceitos Técnicos Implementados

- **Programação Orientada a Protocolos** para interfaces flexíveis e testáveis
- **Gerenciamento Avançado de Ciclo de Vida** dos componentes UIKit
- **Padrão Delegate** para comunicação entre componentes
- **Operações Assíncronas** para manipulação de dados e imagens
- **Gerenciamento Eficiente de Memória** para performance otimizada
- **Animações Nativas** para experiência de usuário fluida
- **Injeção de Dependências** para componentes desacoplados

## 🎯 Diferenciais do Projeto

- Implementação 100% programática (ViewCode) sem uso de Interface Builder
- Arquitetura escalável e organizada seguindo princípios SOLID
- Uso de técnicas modernas de desenvolvimento iOS
- Performance otimizada mesmo com operações intensivas de imagem
- Interface responsiva adaptada a diferentes tamanhos de tela
- Integração segura com serviços de backend (Firebase)

## 🚀 Instruções de Execução

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

Estou disponível para discutir detalhes técnicos, arquiteturais ou oportunidades profissionais:

- LinkedIn: [Jean Ramalho](https://www.linkedin.com/in/jean-ramalho/)
- Email: jeanramalho.dev@gmail.com

---

⭐️ Desenvolvido por Jean Ramalho | Desenvolvedor iOS | Swift & UIKit
