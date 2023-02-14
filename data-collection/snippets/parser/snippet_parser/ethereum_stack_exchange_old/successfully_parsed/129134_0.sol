contract PreSale is Ownable{
    address coinContract = 0x0012334567890;
    event TransferSent(address from, address to, uint amount);
    uint256 convVal = 3000000;
    
    receive() external payable {
        require(msg.value > 0, "Need more than 0.");
        if(address(msg.sender) != owner()){
            transferToken(msg.sender, convertAmount(msg.value));
        }
    }

    function transferToken(address to, uint256 amount) private{
        require(amount <= IERC20(coinContract).balanceOf(address(this)), "Not enough U coin left in the contract.");
        IERC20(coinContract).transfer(to, amount);
        emit TransferSent( address(this), to, amount);
    }

    function convertAmount(uint256 amount) private view returns(uint256) {
        return amount*convVal;
    }

    function changeConvVal(uint256 val) public onlyOwner{
        convVal = val;
    }

    function takeUFunding() onlyOwner public{
        if(IERC20(coinContract).balanceOf(address(this)) > 0){
            IERC20(coinContract).transfer(owner(),  IERC20(coinContract).balanceOf(address(this)));
        }
    }

    function takeBFunding() onlyOwner public{
        if(address(this).balance > 0){
            payable(owner()).transfer(address(this).balance);
        }
    }
}
