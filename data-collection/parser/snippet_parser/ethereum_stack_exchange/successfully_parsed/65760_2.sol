function getPlayerTokens(uint _tokenStoresId, address playerAdd)
        public
        view 
        returns(uint)
    {
        Str storage s = tokenStores[_tokenStoresId];
        return s.playerTokens[playerAdd];

    }
