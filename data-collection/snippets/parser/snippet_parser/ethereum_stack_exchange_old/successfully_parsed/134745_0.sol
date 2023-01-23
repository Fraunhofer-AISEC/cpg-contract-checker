function withdraw_to_taxman() public view returns (uint256){
    uint256 balance = address(this).balance;
    uint256 withdraw_amount = balance * _tax_rate;
    return (withdraw_amount);
}
