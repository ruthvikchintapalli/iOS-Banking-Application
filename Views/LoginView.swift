import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @Environment(\.managedObjectContext) private var viewContext
    @State private var email = ""
    @State private var password = ""
    @State private var isRegister = false
    @State private var errorMessage = ""
    @StateObject private var firebaseService = FirebaseService(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Image(systemName: "lock.shield")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                
                Text("SecureBank")
                    .font(.largeTitle).bold()
                
                Text("Banking made simple & secure")
                    .foregroundColor(.secondary)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !errorMessage.isEmpty {
                    Text(errorMessage).foregroundColor(.red)
                }
                
                Button(isRegister ? "Register" : "Login") {
                    if isRegister {
                        firebaseService.register(email: email, password: password) { success, error in
                            if success {
                                authService.authenticateWithBiometrics()
                            } else {
                                errorMessage = error?.localizedDescription ?? "Error"
                            }
                        }
                    } else {
                        firebaseService.login(email: email, password: password) { success, error in
                            if success {
                                authService.authenticateWithBiometrics()
                            } else {
                                errorMessage = error?.localizedDescription ?? "Error"
                            }
                        }
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                
                Button("Switch to \(isRegister ? "Login" : "Register")") {
                    isRegister.toggle()
                }
            }
            .padding()
        }
    }
}
