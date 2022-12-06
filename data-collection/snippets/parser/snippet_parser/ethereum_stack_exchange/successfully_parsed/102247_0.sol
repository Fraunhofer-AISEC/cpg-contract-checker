pragma solidity ^0.5.12;

contract B{
    string name="Joe";

    function modify(bytes memory b) public {
        name=string(b);
    }
}
