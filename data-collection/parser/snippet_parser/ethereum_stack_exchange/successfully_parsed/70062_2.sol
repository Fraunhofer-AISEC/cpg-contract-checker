contract first{

    function one(uint8 a, uint8 b) public pure returns(uint8){
        uint8 c = a + b; 
        require(c>a);
        return c;
    }

    function two(uint8 c, uint8 d)public pure returns(uint8){
        uint8 e = c + d;
        require(e>c);
        return e;
    }

}
