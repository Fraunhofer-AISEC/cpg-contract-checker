    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].executed, "tx already executed");
        _;
    }

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "owners required");
        require(_required > 0 && _required <= _owners.length,
        "invalid required number of owners"
        );

        
        for (uint i; i < _owners.length; i++) {
            address owner = _owners[i];
            
            require(owner != address(0), "invalid owner");
            require( !isOwner[owner], "owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        required = _required;

    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    
    function submit( address _to, uint _value, bytes calldata _data)
        external
        onlyOwner
        {
            transactions.push(Transaction({
                to: _to,
                value: _value,
                data: _data,
                executed: false
            }));
            emit Submit(transactions.length - 1);
        }

    
    function approve(uint _txId)
        external
        onlyOwner
        txExists(_txId)
        notApproved(_txId)
        notExecuted(_txId)
        {
            approved[_txId][msg.sender] = true;
            emit Approve(msg.sender, _txId);
        }

    
    function _getApprovalCount(uint _txId) private view returns (uint count) {
        for (uint i; i < owners.length; i++) {
            if (approved[_txId][owners[i]]) {
                count += 1;
            }        
        }
    }
