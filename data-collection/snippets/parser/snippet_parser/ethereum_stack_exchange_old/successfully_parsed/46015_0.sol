pragma solidity ^0.4.0;


contract callee{

    uint public x;

    constructor() public
    {
        x = 1;
    }

    function set (uint k) public
    {
        x = k;
    }

    function get () public view returns (uint)
    {
        return x;
    }

}

contract caller{

    callee c;

    constructor() public
    {
        c = new callee();
    }

    function get() public view returns (uint k)
    {
        return c.get();
    }

    function set(uint k) public
    {
        c.set(k);
    }

    function get_calle() public view returns (callee)
    {
        return c;
    }


}
