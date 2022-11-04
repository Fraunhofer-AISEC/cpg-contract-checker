   uint public constant regularPrice = 100;
   uint public constant moreThan20EthContributionPrice = 75;

   function () payable { 
   

   ... some code ...

   uint price = calculatePrice();

   ... some code ...

    }

    function calculatePrice() internal constant returns (uint) {
        if (msg.value > 20 ether) return moreThan20EthContributionPrice;
        return regularPrice;
   }
