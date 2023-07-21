bytes memory offer = new bytes(162);

assembly {
    let dataPtr := add(data, 32) 
    let offerPtr := add(offer, 32) 
    mstore(offer, 162) 
    for { let i := 0 } lt(i, 162) { i := add(i, 32) } {
        mstore(add(offerPtr, i), mload(add(dataPtr, i)))
    }
}
