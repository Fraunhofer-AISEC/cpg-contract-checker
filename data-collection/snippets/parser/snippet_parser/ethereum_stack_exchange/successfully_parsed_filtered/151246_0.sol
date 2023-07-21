
pragma solidity 0.8.19;
import "./storage.sol";
contract dex1{
    storage_contract public contractaddress;
    constructor(address _storageContract){
        contractaddress = storage_contract(_storageContract);
    }

    function addmoney(uint amount)public returns(uint){
        uint balance = contractaddress._addmoney(amount);
        return balance;

    }
    function getbalance(address _address)public view returns(uint) {
        uint balance = contractaddress._getbalance(_address);
        return balance;
    }

}
