pragma solidity ^0.4.17;

contract Test {

    mapping (uint256 => address) aMapping;

    function set() public {
        aMapping[1] = this;
    }

    function testA() public  {
        aMapping[0] = 0;
    }

        function testB() public  {
        aMapping[1] = 0;
    }

            function testC() public  {
        aMapping[2] = 0;
    }
}
