  function calculate(
   uint index
       )public view returns(uint, uint, bool){
   uint avh1;
   uint avh2;
   uint avh3;
   uint avl1;
   uint avl2;
   uint avl3;
  
   uint allowbuy;
   uint allowsell;
           
        
           priceHistory memory coinToReturn = stableCoins[index];
           
           avh1 = coinToReturn.highestPricethismonth.add (coinToReturn.highestPrice2MonthsAgo);
           avh2 = coinToReturn.highestPrice3MonthsAgo.add (coinToReturn.highestPrice4MonthsAgo);
           avh3 = avh1.add (avh2); avh3/4= allowsell;
           avl1 = coinToReturn.lowestPricethismonth.add (coinToReturn.lowestPrice2MonthsAgo);
           avl2 = coinToReturn.lowestPrice3MonthsAgo.add (coinToReturn.lowestPrice4MonthsAgo);
           avl3 = avl1.add (avl2); avl3.div  (4)  = allowbuy;
           
           
          return (allowbuy);
          return (allowsell);
          return (success);
        
        }
