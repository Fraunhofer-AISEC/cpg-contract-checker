
address customTokenAddress = 0xcustom_token_address;


bytes4 customTokenABI = 0xcustom_token_abi;


CustomToken customToken = CustomToken(customTokenAddress);


customToken.transfer(winner, reward2Transfer);
