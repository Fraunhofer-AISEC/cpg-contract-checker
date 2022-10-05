function createAccount(string name, string secName) isCreator {
        Account account = new Account(name, secName);
        accounts.push(account);
    }
