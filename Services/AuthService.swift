import LocalAuthentication
import Combine

class AuthService: ObservableObject {
    @Published var isAuthenticated = false
    private let keychain = KeychainHelper()
    
    func authenticateWithBiometrics() {
        let context = LAContext()
        let reason = "Unlock SecureBank"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                        self.saveMockToken()
                    }
                }
            }
        } else {
            // Fallback: Auto-login for demo
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isAuthenticated = true
                self.saveMockToken()
            }
        }
    }
    
    private func saveMockToken() {
        keychain.save("userToken", data: "demo-jwt-token-123".data(using: .utf8)!)
    }
    
    func logout() {
        isAuthenticated = false
        keychain.delete("userToken")
    }
}
