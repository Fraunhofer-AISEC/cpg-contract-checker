constructor() payable {
    owner = msg.sender;
    funds = msg.value;
    transferFund = false;
}
