
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Borrow is ERC721, IERC721Receiver {
    
    mapping (uint256 => Loan) public loans;

    uint256 count;

    struct Loan {
        ERC721 nftContract;
        uint256 tokenId;
        address borrower;
        bool repayable;
    }

    
    

    function onERC721Received(
        address,
        uint256 _tokenId,
        address _borrower,
        bytes calldata
    )
        external
        virtual
        returns(bytes4)
    {
        uint256 loanId = uint256(keccak256(abi.encode(address(msg.sender), _tokenId)));
        loans[loanId] = Loan({
            nftContract: ERC721(msg.sender),
            tokenId: _tokenId,
            borrower: _borrower,
            repayable: false
        });


        return 0x150b7a02;
    }
}
