  constructor( address payable _NFT_CONTRACT, address payable _TOKEN_CONTRACT) payable {
    NFT_CONTRACT = IERC721(_NFT_CONTRACT);
    TOKEN_CONTRACT = IERC20(_TOKEN_CONTRACT);
  }
