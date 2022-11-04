pragma solidity ^0.4.20;

contract Parent {

    uint256[] values;
    mapping (address => uint256[])transactions;


    function storeValue(uint256 _value) {

        transactions[msg.sender].push(_value);
    }

    function accountTx(address addr) constant returns(uint256[]) {

        return (transactions[addr]);
    }

}
