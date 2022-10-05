pragma solidity >=0.4.22 <0.9.0;

function withdraw(address payable _to, uint256 _amount) public returns (bool){
    bool sent = _to.send(_amount);
    return sent;
}
