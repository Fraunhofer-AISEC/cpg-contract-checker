function submitOffer(uint256 foo) public payable {
    emit MyEvent(foo);
    
    require(foo > 10, "Foo must be greater than 10");
}
