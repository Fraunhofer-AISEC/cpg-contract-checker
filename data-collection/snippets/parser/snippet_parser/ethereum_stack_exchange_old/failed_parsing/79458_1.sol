address[] memory recipients = new address[](2);
uint[] memory tokenAmounts = new uint[](2);
(recipients[0], recipients[1]) = (testWalletAddress[4], testWalletAddress[3]);
(tokenAmounts[0], tokenAmounts[1]) = (10**18, 10**19);
Test(ContractAddress).airDropMultiple(recipients, tokenAmounts);
