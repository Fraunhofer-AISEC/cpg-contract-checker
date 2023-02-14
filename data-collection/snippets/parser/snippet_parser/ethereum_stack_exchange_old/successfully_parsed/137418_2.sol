pragma solidity ^0.8.16;

contract DoStuff {

    event DidStuff(uint256 timestamp);

   function doStuff(bytes[] memory _data) public {

        

        emit DidStuff(block.timestamp);
    }

}

contract Contract {

    address CONTRACT_ADDRESS;

    constructor(address doStuffAddress) {
        CONTRACT_ADDRESS = doStuffAddress;
    }
    
    function doIt() public {

        bytes[] memory dataArray = new bytes[](1);
(bool success, bytes memory returnData) = CONTRACT_ADDRESS.call(
            abi.encodeWithSignature("doStuff(bytes[])", dataArray)
        );

    }

}
