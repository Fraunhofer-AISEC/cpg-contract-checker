pragma solidity >=0.6.0 <0.8.0;

contract Simple {

    function getAddress(uint256 p) public  returns (address) {
        address pool = address(p);
        return pool;
    }
}
