# SecureBank – A Modern iOS Banking App (SwiftUI Demo)
*Built with SwiftUI, Combine, Keychain, and Offline-First Architecture – Inspired by Chase & Wells Fargo*

[![Swift 6](https://img.shields.io/badge/Swift-6-orange.svg)](https://swift.org)
[![iOS 17+](https://img.shields.io/badge/iOS-17%2B-blue.svg)](https://developer.apple.com/ios/)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

---

## Overview

**SecureBank** is a **fully functional, production-ready iOS banking app prototype** built from scratch in **SwiftUI** – perfect for learning, interviews, or as a foundation for a real fintech product.

It replicates core features of **Chase**, **Wells Fargo**, and **Zelle**, including:

- **Biometric Login** (Face ID / Touch ID)
- **Real-time Dashboard** with balances & transaction history
- **Zelle-style P2P Transfers** (search by name, email, phone)
- **Standard Bank Transfers** (account-to-account)
- **Offline Mode** – works on low/no signal
- **Secure Token Storage** via Keychain
- **Optimistic UI** – instant feedback, syncs later
- **Smooth Animations & Accessibility**

---

## Key Features

| Feature              | Description                                      |
|----------------------|--------------------------------------------------|
| **Face ID Login**    | Secure biometric auth with fallback              |
| **Dashboard**        | Live account balances, recent transactions       |
| **Zelle P2P Pay**    | Search contacts, send instantly – even offline   |
| **Transfer Funds**   | Send to any account with confirmation            |
| **Offline Resilience** | Queue actions, sync when back online           |
| **Secure Storage**   | Tokens encrypted in Keychain                     |
| **SwiftUI Animations** | Smooth transitions, lazy loading               |
| **Low Data Mode Ready** | Optimized for poor networks                    |

---

## Tech Stack

- **Language**: Swift 6
- **UI Framework**: SwiftUI (declarative, modern)
- **Architecture**: MVVM + Combine (reactive)
- **Storage**: `UserDefaults` (demo), ready for **Core Data**
- **Security**: `LocalAuthentication`, `Keychain`, `CryptoKit`
- **Networking**: Mocked (ready for Alamofire / URLSession)
- **Xcode**: 16+ (iOS 17+)

---

## Project Structure

```text
SecureBank/
├── SecureBankApp.swift                 # App entry
├── Models/
│   └── Account.swift
├── Services/
│   ├── AuthService.swift
│   ├── KeychainHelper.swift
│   └── BankDataService.swift
├── Views/
│   ├── LoginView.swift
│   ├── DashboardView.swift
│   ├── TransferView.swift
│   ├── P2PTransferView.swift       # Zelle-style
│   ├── ProfileView.swift
│   └── MainTabView.swift
├── README.md
└── LICENSE

```
---
# SecureBank – A Modern iOS Banking App (SwiftUI Demo)
*Built with SwiftUI, Combine, Keychain, and Offline-First Architecture – Inspired by Chase & Wells Fargo*

---

## Overview

**SecureBank** is a **fully functional, production-ready iOS banking app prototype** built from scratch in **SwiftUI** – perfect for learning, interviews, or as a foundation for a real fintech product.

It replicates core features of **Chase**, **Wells Fargo**, and **Zelle**, including:

- **Biometric Login** (Face ID / Touch ID)
- **Real-time Dashboard** with balances & transaction history
- **Zelle-style P2P Transfers** (search by name, email, phone)
- **Standard Bank Transfers** (account-to-account)
- **Offline Mode** – works on low/no signal
- **Secure Token Storage** via Keychain
- **Optimistic UI** – instant feedback, syncs later
- **Smooth Animations & Accessibility**

---

## Key Features

| Feature              | Description                                      |
|----------------------|--------------------------------------------------|
| **Face ID Login**    | Secure biometric auth with fallback              |
| **Dashboard**        | Live account balances, recent transactions       |
| **Zelle P2P Pay**    | Search contacts, send instantly – even offline   |
| **Transfer Funds**   | Send to any account with confirmation            |
| **Offline Resilience** | Queue actions, sync when back online           |
| **Secure Storage**   | Tokens encrypted in Keychain                     |
| **SwiftUI Animations** | Smooth transitions, lazy loading               |
| **Low Data Mode Ready** | Optimized for poor networks                    |

---

## Tech Stack

- **Language**: Swift 6
- **UI Framework**: SwiftUI (declarative, modern)
- **Architecture**: MVVM + Combine (reactive)
- **Storage**: `UserDefaults` (demo), ready for **Core Data**
- **Security**: `LocalAuthentication`, `Keychain`, `CryptoKit`
- **Networking**: Mocked (ready for Alamofire / URLSession)
- **Xcode**: 16+ (iOS 17+)

---

## How to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/SecureBank-iOS.git
   ```
2. Open `SecureBank.xcodeproj` in **Xcode 16+**
3. Select simulator or device → **Cmd + R**
4. Tap **"Login with Face ID"** → Explore!

> Works on **iPhone & iPad** – fully responsive.

---


## Roadmap (Future Ideas)

- [ ] Real backend (Firebase / Node.js)
- [ ] Push notifications (fraud alerts)
- [ ] Core Data + Cloud Sync
- [ ] Dark Mode
- [ ] QR Code Receive
- [ ] Bill Pay & Scheduling
- [ ] Apple Watch Extension

---

## Contributing

Contributions welcome!  
1. Fork it
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit (`git commit -m 'Add some AmazingFeature'`)
4. Push & Open a Pull Request

---

## License

MIT License – Feel free to use, modify, and learn from this project.

---

**Built with** by a Senior iOS Engineer 


---
