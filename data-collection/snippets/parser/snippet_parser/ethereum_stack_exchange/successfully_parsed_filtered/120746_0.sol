    contract PrimeNumberChecker {

     function isPrime(uint n) public pure returns(string memory){
        for(uint i = 2;i<n;i++){
             if(n % i ==0){
                return "Not a prime";
               }
             else{
                return "prime";
            }
          }
      }
   }
