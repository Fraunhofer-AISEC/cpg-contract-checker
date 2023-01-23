   function validateAndGetFirstProofOutput(
        bytes memory _proofData,
        address _proofSender
    ) public returns (bytes memory, bytes32) {
        bytes memory formattedProofOutput = ace.validateProof(JOIN_SPLIT_PROOF, _proofSender, _proofData).get(0);
        lastProofOutput = formattedProofOutput;
        lastProofHash = keccak256(formattedProofOutput);
        return (lastProofOutput, lastProofHash);
    }

