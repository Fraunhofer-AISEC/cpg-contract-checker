string test;
    function assemblyStorage() public payable returns (string memory a){
     test = "good";
     assembly {
         a:=sload(0)
     }
    }
