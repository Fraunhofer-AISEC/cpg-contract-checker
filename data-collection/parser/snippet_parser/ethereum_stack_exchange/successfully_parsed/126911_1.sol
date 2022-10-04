
pragma solidity ^0.8.0;

contract Storage {
    bytes32 a;
    bytes32 b;

    string er = "Denied";

    function checkOffers(bytes32 value) public view returns(uint256, string memory){
        if(a == b){
            value = a;
            return (block.number, "");
        }else{
            return (0, er);
        }
    }
}
