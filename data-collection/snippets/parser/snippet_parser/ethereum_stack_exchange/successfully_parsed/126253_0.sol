    
pragma solidity ^0.8.13;
pragma abicoder v2;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
contract TestERC1155 is ERC1155 {
    constructor()
        ERC1155(
            "https:/asdasdasd.com/{id}.json"
        )
    {}
    
    function _afterTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual override {
        super._afterTokenTransfer(operator,from,to,ids,amounts,data);
        

    }
}
