function checkUpkeep(bytes memory ) public view override returns (
        bool upkeepNeeded, 
        bytes memory num
        ){
        
        bool sellTime; 
        bool Quant;
        uint256 EthPrice;
        
        

        EthPrice = getPrice();

        address[] memory id = new address[](s_Wallets.length);

        for (uint i = 0; i < s_Wallets.length; i++) {           
          id[i] = s_Wallets[i];
          Dades memory Data = s_Registre[id[i]];
          uint256 SL = Data.Stop;
          uint256 Q = Data.QuantityETH;
          sellTime = (SL <= EthPrice); 
          Quant = (Q > 0);
          if (sellTime && Quant){
            num = abi.encode(i);
            
            
            upkeepNeeded = (sellTime && Quant);
            break;
          }
          
        }  
        
        return (upkeepNeeded, num);
    }

    function performUpkeep(bytes calldata num) external override {
        (bool upkeepNeeded, ) = checkUpkeep("");
        
        if (!upkeepNeeded) {
            revert Order__UpkeepNotNeeded(
                address(this).balance,
                s_Wallets.length
            );
        }
        
        uint256 number;
        number = abi.decode(num, (uint256));

        
        
        Dades storage dades = s_Registre[s_Wallets[number]];
        dades.QuantityETH = 0;
        dades.Stop = 0;
        
        s_Wallets = Remove(number);
    }
