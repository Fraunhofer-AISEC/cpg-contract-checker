  
  pragma solidity 0.8.13;

  import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
  import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
  import "@openzeppelin/contracts/access/Ownable.sol";
  import "@openzeppelin/contracts/utils/Address.sol";
  import "@openzeppelin/contracts/utils/Strings.sol";
  import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
  import "@openzeppelin/contracts/utils/Counters.sol";
  import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol";
  import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";


  ERC721 constant EXAMPLE_CONTRACT = ERC721(0x45cA56EE242F14419499D60cd5876E07d54394cE);
  IERC721 constant EXAMPLE_CONTRACTIERC721 = IERC721(0x45cA56EE242F14419499D60cd5876E07d54394cE);
  IERC721Enumerable constant EXAMPLE_CONTRACTENUMARABLE = IERC721Enumerable(0x45cA56EE242F14419499D60cd5876E07d54394cE);



  contract Evolution is IERC721Receiver{

        function change(uint256 gen1tokenId) external {

           EXAMPLE_CONTRACT.safeTransferFrom(msg.sender, address(this), gen1tokenId);
           
        }

     
  }
