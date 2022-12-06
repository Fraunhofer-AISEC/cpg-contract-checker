contract MyContract is Ownable, AccessControl, EIP712 {
    struct Action {
        address initiator;
        string name;
    }
    bytes32 public constant ACTION_TYPE_HASH = keccak256("Action(address initiator,string name)");
    function _hashStruct(Action memory action) private pure returns (bytes32) {
        
        
        
        return keccak256(abi.encode(ACTION_TYPE_HASH, action.initiator, keccak256(abi.encodePacked(action.name))));
    }
    function _hashTypedDataV4(Action memory action) private view returns (bytes32) {
        bytes32 structHash = _hashStruct(action);
        return EIP712._hashTypedDataV4(structHash);
    }
    
}

