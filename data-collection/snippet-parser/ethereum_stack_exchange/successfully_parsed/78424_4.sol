    function confidentialTrade(
        bytes memory _proofOutputs,
        bytes memory _signatures,
        bytes memory _proofData
    ) public {

        bytes memory formattedProofOutput = ParamUtils.sliceBytes(_proofOutput, 32, _proofOutput.length);

        bytes32 proofHash = keccak256(formattedProofOutput);
        require( ace.validateProofByHash(
            JOIN_SPLIT_PROOF, proofHash, address(this)
            ), "proof output is invalid" );

        bytes memory proofOutput = TradeUtils.getFirstProofOutput(_proofOutputs);

        (,
        ,
        ,
        int256 publicValue) = proofOutput.extractProofOutput();

        (
            ,
            uint256 scalingFactor,
            uint256 totalSupply,
            ,
            ,
            ,
        ) = ace.getRegistry(address(this));
        if (publicValue > 0) {
            if (totalSupply < uint256(publicValue)) {
                uint256 supplementValue = uint256(publicValue).sub(totalSupply);
                ERC20Mintable(address(linkedToken)).mint(address(this), supplementValue.mul(scalingFactor));
                ERC20Mintable(address(linkedToken)).approve(address(ace), supplementValue.mul(scalingFactor));

                ace.supplementTokens(supplementValue);
            }
        }
        

        confidentialTransferInternal(_proofOutputs, _signatures, _proofData);
    }

