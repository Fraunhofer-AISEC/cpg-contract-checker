constructor () {
        _rOwned[_msgSender()] = _rDepl;

        _rOwned[REWARDS_BAG_WALLET] = _rrewardBagTokens;

        _rOwned[teamMembers[0]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[1]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[2]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[3]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[4]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[5]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[6]] = _rperTeamMemberTokens;
        _rOwned[teamMembers[7]] = _rperTeamMemberTokens;
       
        
        
        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[address(this)] = true;

        _isExcludedFromFee[REWARDS_BAG_WALLET] = true;

        _isExcludedFromFee[teamMembers[0]] = true;
        _isExcludedFromFee[teamMembers[1]] = true;
        _isExcludedFromFee[teamMembers[2]] = true;
        _isExcludedFromFee[teamMembers[3]] = true;
        _isExcludedFromFee[teamMembers[4]] = true;
        _isExcludedFromFee[teamMembers[5]] = true;
        _isExcludedFromFee[teamMembers[6]] = true;
        _isExcludedFromFee[teamMembers[7]] = true;


        
        emit Transfer(address(0), _msgSender(), _tDepl);
        emit Transfer(address(0), REWARDS_BAG_WALLET, _tRewardBagTokens);
        emit Transfer(address(0), teamMembers[0], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[1], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[2], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[3], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[4], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[5], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[6], _tPerMemberTokens);
        emit Transfer(address(0), teamMembers[7], _tPerMemberTokens);
    }
