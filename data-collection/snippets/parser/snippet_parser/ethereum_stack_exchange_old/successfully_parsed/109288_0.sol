function createTokenAndDex(string tokenName, string tokenTicker, 
        uint initialSupply, uint initialPrice, bool isActive) public {

        
        address newDexAddress = new Dex(initialPrice, isActive);

        
        address newTokenAddress = new Token(tokenName, tokenTicker, initialSupply, newDexAddress);

        
        DeployedTokenStruct memory newDeployedTokenStruct = DeployedTokenStruct({
            tokenName: tokenName,
            tokenTicker: tokenTicker,
        initialSupply: initialSupply,
        initialPrice: initialPrice,
        });

        mapTokenNameToTokenAddress[tokenName] = newTokenAddress;

        mapTokenAddressToTokenStruct[newTokenAddress] = newDeployedTokenStruct;

        mapTokenNameToTokenStruct[tokenName] = newDeployedTokenStruct;

        deployedTokensAddr.push(newTokenAddress);

        deployedTokensStruct.push(newDeployedTokenStruct);
    
    
        deployedDexs.push(newDexAddress);

        mapTokenAddrToDexAddr[newTokenAddress] = newDexAddress;

        mapTokenNameToDexAddr[tokenName] = newDexAddress;

        mapDexAddrToTokenStruct[newDexAddress] = newDeployedTokenStruct;
    
    }
