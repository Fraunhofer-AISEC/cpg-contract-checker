function getAllClientsOfABank(bytes32 BankName) returns(uint[]) {
    uint[] memory Clientss = new uint[](Banks[BankName].numberOfClients);

    for(uint i = 0; i < Banks[BankName].numberOfClients; i++) {
        Clientss[i]=Banks[BankName].Clients[i].cin;

    }
    return Clientss;
}
