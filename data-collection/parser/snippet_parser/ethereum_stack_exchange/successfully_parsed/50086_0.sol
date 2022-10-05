pragma solidity ^0.4.20;

contract Parent {

    struct Info{
        string fName;
        string lName;
    }

    uint256[] values;

    mapping(address => Info) names;
    mapping (address => uint256[])transactions;
    mapping (address => uint) accountBalance;


    function setName(address addr,string _fName, string _lName){
        names[addr] = Info(_fName, _lName);
    }

    function getFName(address addr) constant returns (string){
        return names[addr].fName;
    }

    function getLName(address addr) constant returns (string){
        return names[addr].lName;
    }

    function storeValue(address addr, uint256 _value) {
        transactions[addr].push(_value);
        accountBalance[addr] += _value;
    }

    function accountTx(address addr) constant returns(uint256[]) {
        return (transactions[addr]);
    }

    function totalBalance(address addr) constant returns(uint){
        return accountBalance[addr];
    }

}
