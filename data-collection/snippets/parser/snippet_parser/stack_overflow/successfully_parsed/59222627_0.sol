  
    function setAccepted()  public returns(Status){

        emit setToAccept(status,now,msg.sender);
        bool success;
        bytes memory result;

        (success,result) = delegateContract.delegatecall(abi.encodePacked(bytes4(keccak256("setAccepted()"))));
        require(success);
        status = abi.decode(result, (Status));
        return status;

    }
