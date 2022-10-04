  function mint(uint256 count) public payable nonReentrant {
    require(saleIsActive, "Sale not active");

    if (allowedMintCount(_msgSender()) >= count) {
      updateMintCount(_msgSender(), count);
    } else {
      revert("Minting limit exceeded");
    }

    require(totalSupply() + count - 1 < MAX_SUPPLY, "Exceeds max supply");

    require(count <= MAX_MULTIMINT, "Mint at most 20 at a time");

    require(
      msg.value >= PRICE * count, "Insufficient payment, 25 MATIC per item"
    );

    for (uint256 i = 0; i < count; i++) {
      _safeMint(_msgSender(), totalSupply());
    }
  }
