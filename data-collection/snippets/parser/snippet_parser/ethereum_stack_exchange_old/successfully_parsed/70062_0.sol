contract first{

    function one(uint256 a, uint256 b) public pure returns(uint){
        uint256 c = a + b; 
        return c;
    }

    function two(uint c, uint d)public pure returns(uint){
        uint256 e = c + d;
        return e;
    }

}
