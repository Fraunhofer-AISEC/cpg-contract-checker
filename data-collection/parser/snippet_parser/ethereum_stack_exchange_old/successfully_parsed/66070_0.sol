pragma solidity ^0.5.0;

contract X {
    event E(bytes data);

    function b(bytes memory _b) public {
        emit E(msg.data);
    }
}

contract Test {
    event E(bytes data);

    X x = new X();

    function b(bytes memory _b) public payable {

        emit E(msg.data);

        
        bytes memory callData = new bytes(msg.data.length-30);

        for(uint i=0; i<callData.length && i<msg.data.length; i++) {
            callData[i] = msg.data[i];
        }

        
        (bool res, bytes memory ret) = address(x).call(callData);

        assert(res);
    }

}
