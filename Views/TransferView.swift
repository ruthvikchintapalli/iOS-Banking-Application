import SwiftUI

struct TransferView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var dataService = BankDataService()
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
                            dataService.sendTransfer(amount: amt, to: toAccount) { _ in
                                showSuccess = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    dismiss()
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
