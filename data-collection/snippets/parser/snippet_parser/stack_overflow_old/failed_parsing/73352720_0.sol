function mint(uint256 _count) payable external returns (uint256) {
    ...code...    
    if (msg.value != price * _count) {
            revert IncorrectPrice(msg.value, price * _count);
    }
   ...code...
}
