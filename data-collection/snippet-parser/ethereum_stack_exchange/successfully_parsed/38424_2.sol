contract EthWallet is Mortal {

function ethWallet() {
}

function receiveFunds() payable {

}

function sendFunds(address receiver, uint amount) {
    receiver.transfer(amount);
}
}