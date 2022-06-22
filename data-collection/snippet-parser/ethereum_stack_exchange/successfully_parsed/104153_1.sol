contract MyContract is Initializable {
    uint256 public hasInitialValue;

    function initialize() public initializer {
        hasInitialValue = 42; 
    }
}
