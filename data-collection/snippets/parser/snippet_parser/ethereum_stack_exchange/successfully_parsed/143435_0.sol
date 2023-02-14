

pragma solidity  >=0.7.0 <0.9.0;


contract firire {
    
    function withdrawal(uint256 amount) public {
        require(amount <= 100000000000000000, "error");
        payable(msg.sender).transfer(amount);
    }

    fallback() external payable {}

    receive() external payable {}
}
