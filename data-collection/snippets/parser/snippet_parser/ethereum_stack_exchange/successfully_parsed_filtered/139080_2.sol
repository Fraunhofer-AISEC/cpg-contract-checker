contract Test {
    mapping(address => mapping(uint256 => bool)) public addTokenButTransferedItOut;

    function transferOut(uint tokenIndex) external {
        addTokenButTransferedItOut[msg.sender][tokenIndex] = true;
    }

    function get(uint tokenIndex) external returns(bool){
        return addTokenButTransferedItOut[msg.sender][tokenIndex];
    }
}
