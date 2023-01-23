function _delegatecall(address target, bytes memory data) internal returns (bytes memory) {
    (bool success, bytes memory returndata) = target.delegatecall(data);
    if (!success) {
        if (returndata.length == 0) revert();
        assembly {
            revert(add(32, returndata), mload(returndata))
        }
    }
    return returndata;
}
