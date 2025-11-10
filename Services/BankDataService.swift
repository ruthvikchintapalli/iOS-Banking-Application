import Foundation
import Combine

class BankDataService: ObservableObject {
    @Published var accounts: [Account] = []
    @Published var transactions: [Transaction] = []
    
    private let defaults = UserDefaults.standard
    private let accountsKey = "cachedAccounts"
    private let transactionsKey = "cachedTransactions"
    
    init() {
        loadCachedData()
    }
    
    func loadCachedData() {
        if let data = defaults.data(forKey: accountsKey),
           let decoded = try? JSONDecoder().decode([Account].self, from: data) {
            accounts = decoded
        } else {
            // Mock data
            accounts = [
                Account(name: "Checking", balance: 5420.00, accountNumber: "****1234"),
                Account(name: "Savings", balance: 12500.00, accountNumber: "****5678")
            ]
        }
        
        if let data = defaults.data(forKey: transactionsKey),
           let decoded = try? JSONDecoder().decode([Transaction].self, from: data) {
            transactions = decoded
        } else {
            transactions = mockTransactions()
        }
    }
    
    func sendTransfer(amount: Double, to: String, completion: @escaping (Bool) -> Void) {
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // Optimistic update
            let newTx = Transaction(amount: -amount, description: "To \(to)", date: Date(), isPending: true)
            self.transactions.insert(newTx, at: 0)
            self.accounts[0].balance -= amount
            self.saveCache()
            completion(true)
        }
    }
    
    private func saveCache() {
        if let accData = try? JSONEncoder().encode(accounts) {
            defaults.set(accData, forKey: accountsKey)
        }
        if let txData = try? JSONEncoder().encode(transactions) {
            defaults.set(txData, forKey: transactionsKey)
        }
    }
    
    private func mockTransactions() -> [Transaction] {
        [
            Transaction(amount: -45.99, description: "Starbucks", date: Date().addingTimeInterval(-86400), isPending: false),
            Transaction(amount: -1200.00, description: "Rent", date: Date().addingTimeInterval(-172800), isPending: false),
            Transaction(amount: 3000.00, description: "Paycheck", date: Date().addingTimeInterval(-345600), isPending: false)
        ]
    }
}
