
pragma solidity ^0.8.4;

import "./NewToken.sol";


import "@openzeppelin/contracts/access/Ownable.sol";
contract BuySell is Ownable {

    struct sellingInstance {
        address payable seller;
        address tokenAddress;
        uint256 amountOfETH;
        uint256 id;
        uint amountToSell;

    }

    struct variables{
        int firstCheapestIndex;
        int nextCheapestIndex;
        bool sent;
        uint price;
        int remainingToBuy;
            
    }

    sellingInstance [] sellingInstances;
    uint256 idCount=0;



    
    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);


    
    function injectionSort(sellingInstance[] memory arr) private pure returns(sellingInstance[] memory array) {
        
        sellingInstance memory key;
        int j;
        for (int i =0; i<int(arr.length); i++){
            key = arr[uint(i)];
            j = i - 1;

            
            
            
            
            while (j >= 0 && arr[uint(j)].amountOfETH > key.amountOfETH)
            {
                arr[uint(j + 1)] = arr[uint(j)];
                j = j - 1;
            }
            arr[uint(j + 1)] = key;
        }
        return arr;
    }

    function getNextCheapest(address tokenAddress, sellingInstance memory previousCheapest, sellingInstance[] memory sortedArray) private pure returns (int instanceIndex){


        for (uint j = 0; j < sortedArray.length; j++) {
            if (sortedArray[j].tokenAddress == tokenAddress && sortedArray[j].amountOfETH> previousCheapest.amountOfETH) {
                return int(sortedArray[j].id); 
            }
        }
        return -1;

    }
    function getFirstCheapest(address tokenAddress, sellingInstance[] memory sortedArray) private pure returns(int instanceIndex){
        for (uint j = 0; j < sortedArray.length; j++) {
            if (sortedArray[j].tokenAddress == tokenAddress) {
                return int(sortedArray[j].id); 
            }
        }
        return -1;
    }


    

    

    
  
    function buyTokens(address tokenAddress, uint promisedPrice, uint amount) public payable {
        uint actualPrice = getPriceForTokens(tokenAddress,amount);
        
        
        
        require(msg.value >= actualPrice, "Send ETH to buy some tokens");
        
        ERC20 newToken = ERC20(tokenAddress);


        
        uint256 vendorBalance = newToken.balanceOf(address(this));
        require(vendorBalance >= amount, "Vendor contract has not enough tokens in its balance");
        require(actualPrice == promisedPrice, "Price mismatch");
        
        
        

        sellingInstance [] memory sortedArray = injectionSort(sellingInstances);

        

        
        sellingInstance memory nextCheapest;

        
        

        variables memory vars = variables(int(getFirstCheapest(tokenAddress, sortedArray)), -1, false, 0, int(amount));
        (vars.sent) = newToken.transfer(msg.sender, amount);
        require(vars.firstCheapestIndex != -1, "No tokens available");
        
        sellingInstance memory firstCheapest= sortedArray[uint(vars.firstCheapestIndex)];
        int firstCheapestRealIndex = int(firstCheapest.id);

        if(firstCheapest.amountToSell>=amount){
            sellingInstances[uint(firstCheapestRealIndex)].amountToSell = sellingInstances[uint(firstCheapestRealIndex)].amountToSell -amount;
            sellingInstances[uint(firstCheapestRealIndex)].seller.transfer((amount * firstCheapest.amountOfETH) / (10 ** 18));
            vars.remainingToBuy = 0;
        }else{
            vars.price= (firstCheapest.amountToSell * firstCheapest.amountOfETH) / (10 ** 18);
            sellingInstances[uint(firstCheapestRealIndex)].seller.transfer(vars.price);
            
            vars.remainingToBuy = vars.remainingToBuy- int(sellingInstances[uint(firstCheapestRealIndex)].amountToSell);
            sellingInstances[uint(firstCheapestRealIndex)].amountToSell=0;
            vars.nextCheapestIndex = getNextCheapest(tokenAddress,firstCheapest, sortedArray);
            
        }
        while(vars.remainingToBuy >0 && vars.nextCheapestIndex!=-1){
            nextCheapest=sellingInstances[uint(vars.nextCheapestIndex)];
            int nextCheapestRealIndex = int(nextCheapest.id);
            if(int(nextCheapest.amountToSell)>=vars.remainingToBuy){
                
                sellingInstances[uint(nextCheapestRealIndex)].amountToSell = sellingInstances[uint(nextCheapestRealIndex)].amountToSell -uint(vars.remainingToBuy);
                sellingInstances[uint(nextCheapestRealIndex)].seller.transfer((uint(vars.remainingToBuy) * nextCheapest.amountOfETH) / (10 ** 18));
                vars.remainingToBuy = 0;

                
            }else{
                vars.price= (nextCheapest.amountToSell * nextCheapest.amountOfETH) / (10 ** 18);
                sellingInstances[uint(nextCheapestRealIndex)].seller.transfer(vars.price);
                vars.remainingToBuy = vars.remainingToBuy- int(sellingInstances[uint(nextCheapestRealIndex)].amountToSell);

                sellingInstances[uint(nextCheapestRealIndex)].amountToSell=0;
                vars.nextCheapestIndex = getNextCheapest(tokenAddress, nextCheapest, sortedArray);
            }
        }

        require(vars.sent, "Failed to transfer token to user");

        
        emit BuyTokens(msg.sender, msg.value, amount);

        
    }

}
