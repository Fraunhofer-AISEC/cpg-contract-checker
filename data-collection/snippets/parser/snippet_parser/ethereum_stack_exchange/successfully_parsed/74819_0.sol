pragma solidity ^0.5.10;


contract C2 {

    address public addr;

    constructor(address per) public {
        addr = per;
    }

    function remote_get_number() external view returns(uint) {
        return C1(addr).get_a_number();
    }

    function remote_set_number(uint num) external {
        C1(addr).set_a_number(num);
    }
}

contract C1 {

    uint public a_number;

    function get_a_number() external view returns(uint) {
        return(a_number);
    }

    function set_a_number(uint num) external  {
        a_number = num;
    }
}
