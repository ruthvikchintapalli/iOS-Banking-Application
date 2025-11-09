import SwiftUI

struct TransferView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var dataService = BankDataService()
    @StateObject private var firebaseService = FirebaseService(context: PersistenceController.shared.container.viewContext)
    @State private var amount = ""
    @State private var toAccount = ""
    @State private var showSuccess = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Amount") {
                    TextField("0.00", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section("To Account") {
                    TextField("Name or Account #", text: $toAccount)
                }
                
                Section {
                    Button("Send Money") {
                        let amt = Double(amount) ?? 0
                        if amt > 0 && !toAccount.isEmpty {
                            firebaseService.sendTransfer(amount: amt, toEmail: toAccount) { success in
                                if success {
                                    showSuccess = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        dismiss()
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .disabled(amount.isEmpty || toAccount.isEmpty)
                }
            }
            .navigationTitle("Transfer")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .alert("Transfer Sent!", isPresented: $showSuccess) {
                Button("OK") { }
            } message: {
                Text("$\(amount) sent to \(toAccount)")
            }
        }
    }
}
