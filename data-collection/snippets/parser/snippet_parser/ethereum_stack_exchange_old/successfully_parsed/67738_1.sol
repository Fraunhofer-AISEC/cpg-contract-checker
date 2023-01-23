function balance(address investor) external constant returns(uint){
    return total_balance[investor];
}
