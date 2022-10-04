pragma solidity 0.7.6;

interface IRecursive {
    function isMe() external view returns(bool);
}

contract Recursive is IRecursive {
    
    function isMe() external view override returns(bool) {
        if(msg.sender == address(this)) return true;
        return false;
    }
    
    function tryThis() external view returns(bool) {
        return IRecursive(address(this)).isMe(); 
    }
}
