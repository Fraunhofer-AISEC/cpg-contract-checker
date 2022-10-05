pragma solidity ^0.4.0;
contract sharer {
    address owner;
    address A;
    address B;

    function sharer (address _A, address _B) public {
        A = _A;
        B = _B;
    }

    function share () payable public {
        A.transfer(msg.value/2);
        B.transfer(msg.value/2);
    }
}
