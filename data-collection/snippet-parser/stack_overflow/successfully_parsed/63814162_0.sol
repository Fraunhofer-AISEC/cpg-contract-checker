function getBuyOrderBook(string symbolName) constant returns (uint[], uint[]) {
    uint8 tokenNameIndex = getSymbolIndexOrThrow(symbolName);
    uint[] memory arrPricesBuy = new uint[](tokens[tokenNameIndex].amountBuyPrices);
    uint[] memory arrVolumesBuy = new uint[](tokens[tokenNameIndex].amountBuyPrices);

       

        uint whilePrice = tokens[tokenNameIndex].lowestBuyPrice;
        uint counter = 0;
        if(tokens[tokenNameIndex].curBuyPrice > 0){ 
            while(whilePrice <= tokens[tokenNameIndex].curBuyPrice ){

                arrPricesBuy[counter] = whilePrice;
                
                uint volumeAtPrice = 0;

                uint offers_key = 0;
                offers_key = tokens[tokenNameIndex].buyBook[whilePrice].offers_key;

                while(tokens[tokenNameIndex].buyBook[whilePrice].offers_length >= offers_key){

                    volumeAtPrice += tokens[tokenNameIndex].buyBook[whilePrice].offers[offers_key].amount;
                    offers_key ++; 
                   
                }
                arrVolumesBuy[counter] = volumeAtPrice;
                if(whilePrice == tokens[tokenNameIndex].buyBook[whilePrice].higherPrice){ 

                    break;
                }
                else{
                    whilePrice == tokens[tokenNameIndex].buyBook[whilePrice].higherPrice ; 

                }
            counter ++; 

        }
           

            

    }

        return (arrPricesBuy, arrVolumesBuy ) ;


}
