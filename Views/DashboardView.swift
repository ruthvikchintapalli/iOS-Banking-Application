import SwiftUI

struct DashboardView: View {
    @StateObject private var dataService = BankDataService()
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var firebaseService = FirebaseService(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(dataService.accounts) { account in
                        AccountCard(account: account)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recent Transactions")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(dataService.transactions.prefix(5)) { tx in
                            TransactionRow(tx: tx)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Accounts")
            .refreshable { firebaseService.fetchAccounts { dataService.accounts = $0 } }
            .onAppear { firebaseService.fetchAccounts { dataService.accounts = $0 } }
        }
    }
}

struct AccountCard: View {
    let account: Account
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(account.name)
                    .font(.headline)
                Text(account.accountNumber)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("$\(account.balance, specifier: "%.2f")")
                .font(.title2).bold()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

struct TransactionRow: View {
    let tx: Transaction
    var body: some View {
        HStack {
            Image(systemName: tx.amount > 0 ? "arrow.down.circle" : "arrow.up.circle")
                .foregroundColor(tx.amount > 0 ? .green : .red)
            
            VStack(alignment: .leading) {
                Text(tx.description)
                Text(tx.date, style: .relative)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(tx.isPending ? "Pending" : "\(tx.amount > 0 ? "+" : "")$\(tx.amount, specifier: "%.2f")")
                .foregroundColor(tx.isPending ? .orange : (tx.amount > 0 ? .green : .primary))
        }
        .padding(.horizontal)
    }
}
