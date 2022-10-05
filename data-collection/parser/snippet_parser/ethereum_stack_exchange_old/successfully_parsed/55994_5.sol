function foo (address _contract, bytes _data) {
    require (_contract.call (_data)); 
}
