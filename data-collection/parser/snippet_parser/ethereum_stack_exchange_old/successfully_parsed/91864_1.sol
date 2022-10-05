contract A {

   struct Price {
        string Price0;
        string Price1;
    }

    mapping (uint => Price) prices;

    constructor (int[][] memory _prices) public
    {

        for(uint i=0; i< _prices.length; i++) 
        {

          prices[i] = Price(
              _prices[i][0],
              _prices[i][1]
          );

        }
    }
}
