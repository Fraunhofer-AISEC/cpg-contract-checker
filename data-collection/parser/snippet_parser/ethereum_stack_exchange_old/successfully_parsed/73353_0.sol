pragma solidity ^0.5.1;

contract Bang{
    address holder;
    address proxy;
    constructor (address _holder, address _proxy) public {
        holder=_holder;
        proxy=_proxy;
    }
    function getholder() public view returns(address){
        return holder;
    }
}
