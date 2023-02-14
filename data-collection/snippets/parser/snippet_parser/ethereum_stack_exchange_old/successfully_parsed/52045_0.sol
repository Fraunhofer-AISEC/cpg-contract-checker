pragma solidity ^0.4.17;

  contract Test {

    address public d_address;
    function deployOther() public {
        d_address = new Referred(123);
    }

    function get() public returns (uint){
        return Referred(d_address).toReturn();
    }
    function set() public payable {
        Referred(d_address).set.gas(21000).value(msg.value)(456);
    }

}

contract Referred {
    uint public val;
    constructor(uint v) public {
        val = v;
    }

    function set(uint nv) public payable{
        val = nv;
    }

    function toReturn() public view returns (uint){
        return val;
    }
}
