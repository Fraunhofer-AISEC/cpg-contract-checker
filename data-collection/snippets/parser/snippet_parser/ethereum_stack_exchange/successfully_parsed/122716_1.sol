uint256[] memory nfts = new uint256[](ownedAmount);

    (bool success, bytes memory result) = address(mainContractAddress).call(abi.encodeWithSignature("walletOfOwner(address)", msg.sender));
    require(success, "Failed to get owned ids...");
    nfts = abi.decode(result, (uint256[]));
