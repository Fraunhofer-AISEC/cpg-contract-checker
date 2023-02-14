
    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount)
        internal
    {
        uint256 _existingContribution;
        uint256 _newContribution;

        require(
            _beneficiary != address(0),
            "Address 0x000...000 can't purchase"
        );

        if (stage == CrowdsaleStage.PreICO1) {
            require(
                investorTrack[_beneficiary].isWhtlP1 == true,
                "Sorry your address has not been whitelisted to enter Private Sale 1"
            );

            _existingContribution = investorTrack[_beneficiary].contributionP1;
            _newContribution = _existingContribution.add(_weiAmount);
            require(
                _newContribution >= investorMinCap &&
                    _newContribution <= investorMaxCap,
                "You can contribute from 0.2 to 1 BNB, no more as total"
            );
            investorTrack[_beneficiary].contributionP1 = _newContribution;
        } else if (stage == CrowdsaleStage.PreICO2) {
            require(
                investorTrack[_beneficiary].isWhtlP2 == true,
                "Sorry your address has not been whitelisted to enter Private Sale 2"
            );

            _existingContribution = investorTrack[_beneficiary].contributionP2;
            _newContribution = _existingContribution.add(_existingContribution);
            _newContribution = _newContribution.add(_weiAmount);
            require(
                _newContribution >= investorMinCap &&
                    _newContribution <= investorMaxCap,
                "You can contribute from 0.2 to 1 BNB, no more as total on both presales"
            );
            investorTrack[_beneficiary].contributionP2 = _newContribution;
        } else revert("Private Sales phases are both ended");
    }
