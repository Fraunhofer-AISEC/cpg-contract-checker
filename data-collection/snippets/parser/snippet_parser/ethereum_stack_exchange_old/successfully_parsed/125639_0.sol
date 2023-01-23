pragma solidity >=0.7.0 <0.9.0;
import "./reader.sol";

contract mymain is reader {
    constructor() {
       myAddress=address(this);
    }
    function getName() public pure returns(string memory) {
        return "foo";
    }
    function getFood() public pure returns(string memory) {
        return "hamburger";
    }
}

contract reader { 
    address myAddress;
    function getAttribute(string memory functionName) public view returns(string memory) {
        bytes memory payload = abi.encodePacked(functionName); 
        bool success;
        bytes memory b;
        (success, b)=myAddress.staticcall(payload);
        if (!success) return "failed";
        return(string(b));
    }
}
