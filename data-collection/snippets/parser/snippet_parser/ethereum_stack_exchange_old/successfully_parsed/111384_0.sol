function foo(bytes calldata data) external payable {
    bytes4 selector;
    assembly {
        selector := calldataload(data.offset)
    }
    
}
