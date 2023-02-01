E       brownie.exceptions.VirtualMachineError: revert: You need to check token allowance
E       Trace step -1, program counter 2196:
E         File "contracts/v2/PetRockNFT.sol", line 36, in NFT.mintNewPetRock:    
E           require(_amount == exchangeValue, "You need to send 1 BTC");
E           uint256 allowance = wBTC.allowance(_msgSender(), address(this));
E           require(allowance == 0);
E      >>>  require(allowance >= exchangeValue, "You need to check token allowance");
E           wBTC.transferFrom(_msgSender(), god, _amount);
E           uint256 _tokenId = totalSupply();
E           super._mint(_to, _tokenId);
