pragma solidity 0.8;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/utils/ERC721Holder.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";

contract TokenTicket1 is ERC721Holder{

     IERC721 public Token;

     constructor (address _token) public {
         Token = IERC721(_token);
     }

     function _approval(uint id) external{
         Token.approve(address(this), id);
     }

     
     function deposit(uint id) external{
         Token.safeTransferFrom(msg.sender, address(this), id);
         
     }
     
     function withdraw(uint Id) external{
         Token.safeTransferFrom(address(this), msg.sender, Id);
     }
     
}
