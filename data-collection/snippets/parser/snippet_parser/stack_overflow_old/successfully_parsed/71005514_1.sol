abstract contract MyContract {
    
    function foo() virtual external returns (bool);

    
    function hello() external pure returns (uint8) {
        return 1;
    }
}
