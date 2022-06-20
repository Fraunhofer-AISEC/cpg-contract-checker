contract RecoveryKeyModule{ 
    GnosisSafeVV2 public safe;
    address public recoverer;

    
    
    
    
    
    
    

    function setup(address _recoverer) public {
        require(address(safe) == address(0), "Module has already been setup");
        safe = GnosisSafeVV2(msg.sender);
        recoverer = _recoverer;
    }

    function recover() external {
        require(msg.sender == recoverer, "You are not allowed to do that");
        
        bytes memory data = abi.encodeWithSignature(
            "addOwnerWithThreshold(address,uint256)",
            recoverer,
            1
        );
        safe.execTransactionFromModule(
            address(safe),
            0,
            data,
            Enum.Operation.Call
        );
    }

    
    function remover() external { ??????
        require(msg.sender == recoverer, "You are not allowed to do that");
        
        bytes memory data = abi.encodeWithSignature(
            "removeOwner(address,uint256)", 
            recoverer,
            1
        );
        safe.execTransactionFromModule(
            address(safe),
            0,
            data,
            Enum.Operation.Call
        );
    }
}
