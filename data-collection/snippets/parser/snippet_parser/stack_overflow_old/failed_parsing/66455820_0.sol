    pragma solidity >=0.7.0 <0.8.0;
    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this)) ));
        admin.transfer( address payable(this).balance)
    }
}
