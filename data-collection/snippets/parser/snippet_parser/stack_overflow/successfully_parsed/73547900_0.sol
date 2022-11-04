
pragma solidity ^ 0.8 .0;

contract MiniTest {

    uint nextWalletNumber = 0;

    struct Wallet {
        address owner;
        uint balance;
        uint debt;
    }

    Wallet[] public walletInfo;

    mapping(address => uint[]) public walletNumbers;

    function createWallet() public {
        Wallet memory newWallet = Wallet(msg.sender, 1000, 0);
        walletInfo.push(newWallet);
        walletNumbers[msg.sender].push(nextWalletNumber);
        nextWalletNumber++;
    }

    function allWalletsBalance() public view returns(uint) {

        uint balance;

        for (uint i; i < walletNumbers[msg.sender].length; i++) {
            balance += Wallet[walletNumbers[msg.sender][i]].balance;
        }

        return balance;

    }

}
