contract Storage {

    uint256 number;

    function store(uint256 num) public {
        number = num;
    }

    modifier onlyMe(){
        require(msg.sender == address(this));
        _;
    }

    function retrieve() public view returns (uint256){
        
        return ((Storage)(this)).get();
    }

    function get() public onlyMe view returns (uint256){
        return number;
    }
}
