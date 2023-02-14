

pragma solidity 0.8.9;

interface interEnum {
    enum SIDE {
        buy,
        sell
    }
}

contract B is interEnum {

    function bEnum(SIDE side) external {
        
    }
}

contract A {
    B b;
    enum NUM {
        buy,
        sell
    }
    function bEnum(NUM num) external {
        
        
        

        
        
        

    }
}
