struct Account {
        string name;
        string secName;
        uint balance;
}

Account[] accounts;

function createAccount(string name, string secName) isCreator {
    accounts.push(Account(name, secName, 1));
}
