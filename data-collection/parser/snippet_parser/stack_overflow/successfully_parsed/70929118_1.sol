    struct ERC223TransferInfo
    {
        address token_contract;
        address sender;
        uint256 value;
        bytes   data;
    }
    
    ERC223TransferInfo private tkn;
        
    
    function tokenReceived(address _from, uint _value, bytes memory _data) public virtual
    {
        
        tkn.token_contract = msg.sender;
        tkn.sender         = _from;
        tkn.value          = _value;
        tkn.data           = _data;
        
        
    }
