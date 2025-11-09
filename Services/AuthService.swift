import LocalAuthentication
import Combine

class AuthService: ObservableObject {
    @Published var isAuthenticated = false
    private let keychain = KeychainHelper()

    func authenticateWithBiometrics(completion: @escaping (Bool) -> Void = { _ in }) {
        let context = LAContext()
        let reason = "Unlock SecureBank"

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                        self.saveMockToken()
                        completion(true)
                    } else {
                        self.fallbackAutoLogin(completion: completion)
                    }
                }
            }
        } else {
            fallbackAutoLogin(completion: completion)
        }
    }

    private func fallbackAutoLogin(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isAuthenticated = true
            self.saveMockToken()
            completion(true)
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
