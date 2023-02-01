function GetSellValue(address[] memory TokenAddress, uint[] memory Amount)public view returns(uint256[] memory){
        uint[] memory Value = new uint[](TokenAddress.length);
        for(uint i = 0; i < TokenAddress.length; i++){
            address Pair = CheckPairValue(TokenAddress[i], Amount[i] * 2);
            address[] memory path;
            if(Pair != PairAddresses[0]){
                path = new address[](3);
                path[0] = TokenAddress[i];
                path[1] = Pair;
                path[2] = PairAddresses[0];
            }
            else
            {
                path = new address[](2);
                path[0] = TokenAddress[i];
                path[1] = PairAddresses[0];
            }
            Value[i] = CheckSellPrice(Amount[i],path);
        }
        return Value;
    }
