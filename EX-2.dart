class BankAccount {
  final int _accountId;
  final String _accountOwner;
  double _balance;

  // Constructor
  BankAccount(this._accountId, this._accountOwner, [this._balance = 0]);

  // Getters
  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double get balance => _balance;

  // Return balance
  double getBalance() => _balance;

  // Withdraw method
  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdrawal amount must be positive!');
    }
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  // Credit method
  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be positive!');
    }
    _balance += amount;
  }

  @override
  String toString() {
    return 'Account ID: $_accountId, Owner: $_accountOwner, Balance: \$$_balance';
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  // Constructor
  Bank({required this.name});

  // Getter for accounts
  List<BankAccount> get accounts => List.unmodifiable(_accounts);

  // Create new bank account
  BankAccount createAccount(int accountId, String accountOwner) {
    // Check for unique account ID
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }

    // Create new account
    var newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print('Balance: \$${ronanAccount.balance}'); // Balance: $0
  ronanAccount.credit(100);
  print('Balance: \$${ronanAccount.balance}'); // Balance: $100
  ronanAccount.withdraw(50);
  print('Balance: \$${ronanAccount.balance}'); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
