contract Contract {

    uint256 public _tax_rate = 1;

    function withdraw_to_taxman() public view returns (uint256){
        uint256 balance = address(this).balance;
        uint256 withdraw_amount = balance * _tax_rate;
        return (withdraw_amount);
    }

    receive() external payable {}

}
