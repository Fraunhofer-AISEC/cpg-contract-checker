contract MyContract {
    bytes32 public product;
    uint public amount;

    function setOrder(bytes32 _product, uint _reorderAmount,) public returns (bool success);   
}
