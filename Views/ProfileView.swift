import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        NavigationView {
            Form {
                Section("User") {
                    HStack {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text("John Doe")
                                .font(.headline)
                            Text("john@example.com")
                                .font(.caption)
                        }
                    }
                }
                
                Section {
                    Button("Logout") {
                        authService.logout()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Profile")
        }
    }
}
