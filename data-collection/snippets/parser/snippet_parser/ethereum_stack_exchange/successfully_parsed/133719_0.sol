

pragma solidity ^0.8.4;

interface myInterface {
    function balanceOf(address owner) external view returns (uint256);
}

contract myContact {

    function getBalance(address _myAddy, address _someContractAddy) external view returns(uint256 balance) {
        myInterface monkeyContract = myInterface(_someContractAddy);
        balance = monkeyContract.balanceOf(_myAddy);
        return balance;
    }
}
