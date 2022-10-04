    function validateProof(
        uint24 _proofType,
        address _sender,
        bytes memory _proofData
    ) public returns (bytes memory) {
        require(_sender == address(this), 'transferer address mismatch');
        return ace.validateProof(_proofType, _sender, _proofData);
    }

    
    function validateProofByHash(
        uint24 _proofType,
        bytes32 _proofHash,
        address _sender
    ) public view returns (bool) {
        require(_sender == address(this), 'transferer address mismatch');
        return ace.validateProofByHash(_proofType, _proofHash, _sender);
    }
