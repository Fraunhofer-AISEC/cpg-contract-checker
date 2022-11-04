contract TokenManager {

   mapping(string => address) public contractERC20;
   address private ZERO_ADDRESS = 0x0000000000000000000000000000000000000000;

   
   constructor(string memory network) public {
       if (compareStrings(network, "ropsten")) {
           registerERC20("DAI", 0xaD6D458402F60fD3Bd25163575031ACDce07538D);
           registerERC20("UNI", 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984);
       }
   }

   
   function compareStrings(string memory s1, string memory s2) private pure returns(bool){
       return keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2));
   }

   
   function registerERC20(string memory _tokenName, address _tokenContract) public {
       require(bytes(_tokenName).length != 0,
           "Token name can't be empty");
       require(contractERC20[_tokenName] == ZERO_ADDRESS,
           "ERC20 contract address already registered");
       contractERC20[_tokenName] = _tokenContract;
   }
   
}
