bytes memory data; 

bytes memory offer = new bytes(162);

assembly {
    mstore(add(offer, 32), mload(add(data, 32)))
    mstore(add(offer, 64), mload(add(data, 64)))
    mstore(add(offer, 96), mload(add(data, 96)))
    mstore(add(offer,128), mload(add(data,128)))
    mstore(add(offer,160), mload(add(data,160)))
}

address denomination;
uint principal;
uint repaymentWithFee;
address collection;
uint nft_id;
address referrer;
uint32 duration;
uint16 adminFee_bps;

assembly { 
    denomination := mload(add(offer, 32))
    principal := mload(add(offer, 64))
    repaymentWithFee := mload(add(offer, 96))
    collection := mload(add(offer,128))
    nft_id := mload(add(offer,160))
    referrer := mload(add(offer,180))
    duration := mload(add(offer,184))
    adminFee_bps := mload(add(offer,186))
}
