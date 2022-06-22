pragma solidity 0.5.1;

contract calledContract {
    event callEvent(address sender, address origin, address from);
    function calledFunction() public {
        emit callEvent(msg.sender, tx.origin, address(this));
    }
}

library calledLibrary {
    event callEvent(address sender, address origin,  address from);
    function calledFunction() public {
        emit callEvent(msg.sender, tx.origin, address(this));
    }
}

contract caller {

    event LogLowLevelCalls(address sender, bool success, bytes response);

    function make_calls(calledContract _calledContract) public {
        
        _calledContract.calledFunction();
        calledLibrary.calledFunction();

        
        bool success;
        bytes memory response;

        bytes memory functionSig = abi.encodePacked(bytes4(keccak256("calledFunction()")));
        (success, response) = address(_calledContract).call(functionSig);
        require(success);
        emit LogLowLevelCalls(msg.sender, success, response);
        (success,  response) = address(_calledContract).delegatecall(functionSig);
        require(success);
        emit LogLowLevelCalls(msg.sender, success, response);
    }
}
