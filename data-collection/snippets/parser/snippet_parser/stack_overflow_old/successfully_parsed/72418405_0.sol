
pragma solidity ^0.8.0;

contract dynamicsizedbyte{

    bytes public by1;

    function setvalue() public {
        by1="abcdefgh";
    }
    
    function pushelement() public {
        by1.push(10);
    }
}
