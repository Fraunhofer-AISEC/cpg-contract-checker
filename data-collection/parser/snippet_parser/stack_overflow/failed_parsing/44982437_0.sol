    uint256 thisNumber = 4;

    modifier HigherThan2(uint256 _x) {

      if (_x < 2) {
           throw;
       }

       _; 
    }

    doMathStuff() HigherThan2(thisNumber) {

     

     

    }
