pragma solidity 0.8.7;

 mapping (string => uint) wallet;

function saveWalletData(uint _qty , string _name) public{
    wallet[_name] = _qty;
}

function consultarWallet(string _name) public view returns(uint){
    return wallet[_name];
}
