function decode(bytes memory data) private pure returns(bytes4 selector, uint productAmount, bytes3 color) {
    assembly {
      
      selector := mload(add(data, 32))
      productAmount := mload(add(data, 64))
      color := mload(add(data, 96))
    }
}
