pragma solidity ^0.5.0;

contract hello {
    string greeting;

    function bytes32ToStr(bytes32 _bytes32) public pure returns (string) {

    
    
    

        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }

    constructor () public {
       greeting = "hello";
    }

    function say() public  returns (string memory) {
        bytes32 out;
        bytes32 input;
        
        
        
        
        (bool success, bytes memory returnData) = msg.sender.staticcall(abi.encode(3000, 10, input, input.length, out, out.length));
        if (success == true) {
            return string(returnData);
        } else {
            return "failed!";
        }

        
    }
}
