(bool success, bytes memory returnedData) = address(instance).call{value: 1 ether}(
    abi.encode(instance.buySomething.selector)
);
