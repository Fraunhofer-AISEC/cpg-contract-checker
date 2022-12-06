struct Account {
    address id;
    string company;
    string country;
    string industry;
    bool active;
}


mapping (address => Account) public Accounts;

modifier validAccount(address _accountId) {
    require (Account(msg.sender.active = true))
    _;
}
