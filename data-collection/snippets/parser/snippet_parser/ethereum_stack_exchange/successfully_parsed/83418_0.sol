contract Test {
    using SafeMath for uint256;
    uint256 private counter = 1;
    modifier entrancyGuard() {
        counter = counter.add(1); 
        uint256 guard = counter; 
        _;
        require(guard == counter, "That is not allowed"); 
    }

    function safeWithdraw(uint256 amount) external entrancyGuard() {
        
    }
}
