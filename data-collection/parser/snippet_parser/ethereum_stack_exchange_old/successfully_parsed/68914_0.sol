contract Tester {
    
    function loo() public pure returns(string memory){
        uint i = 1;
        uint c = 0;
        while(i == 1){
            c = c + 1;
        }
        return "good";
    }
}
