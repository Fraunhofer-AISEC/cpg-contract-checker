    function spendTicket(
        uint256 serial, uint256 option, bytes memory proof
    ) external insideVotingPeriod {
        require(!nullified[serial], "ticket already spent");
        uint256[] memory pubSignals = new uint256[](2);
        pubSignals[0] = serial;
        pubSignals[1] = root;
        bool result = verifyProof(proof, pubSignals);
        
        require(result == true, "incorrect proof");
    }
