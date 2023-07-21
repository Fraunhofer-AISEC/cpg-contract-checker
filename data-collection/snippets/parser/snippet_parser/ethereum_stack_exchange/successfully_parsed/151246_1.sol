
pragma solidity 0.8.19;
contract storage_contract{
    mapping(address => uint) public balances;

    function _addmoney(uint _money)public returns(uint) {
        return balances[msg.sender] += _money;
    }
    function _getbalance(address _address)public view returns(uint){
        return balances[_address];
    }
     
}
