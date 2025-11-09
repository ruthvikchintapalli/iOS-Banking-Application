import SwiftUI
import FirebaseCore
import CoreData

@main
struct SecureBankApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var authService = AuthService()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if authService.isAuthenticated {
                MainTabView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(authService)
                    .preferredColorScheme(.dark)  // Force dark mode or use .light for light; remove for system
            } else {
                LoginView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(authService)
            }
        }
    }
}
