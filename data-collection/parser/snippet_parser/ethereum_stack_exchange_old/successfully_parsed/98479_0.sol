function foo(address target, bytes memory data) external {
    
    (bool success, bytes memory result) = target.call(data);

    
    require(success, "Call failed");

    
    emit ExecutionResult(success, result);
}
