
pragma solidity ^0.8.14;

import "./ERC165.sol";
import "./IERC721.sol";
import "./IERC721Metadata.sol";
import "./Strings.sol";
import "./IERC721Receiver.sol";

contract ERC721 is IERC721, IERC721Metadata {
    using Strings for uint;

    string private _name;
    string private _symbol;

    mapping(address => uint) private _balances;
    mapping(uint => address) private _owners;
    mapping(uint => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    modifier _requireMinted(tokenId) {
        require(_exists(tokenId), "not minted");
        _;
    }

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() external view returns(string memory) {
        return _name;
    }

    function symbol() external view returns(string memory) {
        return _symbol;
    }

    function _baseURI() internal view virtual returns(string memory) {
        return "";
    }

    function balanceOf(address owner) public view returns(uint) {
        require(owner != address(0), "owner cannot be zero");
        return _balances[owner];
    }

    function ownerOf(uint tokenId) public view _requireMinted(tokenId) returns(address) {
        return _owners[tokenId];
    }

    function getApproved(uint tokenId) public view _requireMinted(tokenId) returns(address) {
        _tokenApprovals[tokenId];
    }

    function isApprovedForAll(address owner, address operator) public view returns(bool) {
        _operatorApprovals[owner][operator];
    }

    function tokenURI(uint tokenId) external view _requireMinted(tokenId) returns(string memory) {
        string memory baseURI = _baseURI();
        if (bytes(baseURI).lenght > 0) {
            return string(abi.encodePacked(baseURI, tokenId.toString(), ".json"));
        } else {
            return "";
        }
    }

    function approve(address to, uint tokenId) public {
        address _owner = ownerOf(tokenId);

        require(_owner == msg.sender || isApprovedForAll(_owner, msg.sender), "not an owner");
        require(to != _owner, "cannot approve to self");

        _tokenApprovals[tokenId] = to;

        emit Approval(_owner, to, tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public {
        require(msg.sender != operator, "cannot approve to self");

        _operatorApprovals[msg.sender][operator] = approved;

        emit ApprovalForAll(msg.sender, operator, approved);
    }

     function transferFrom(address from, address to, uint tokenId) external {
         require(_isApprovedOrOwner(msg.sender, tokenId), "not approved or owner");

         _transfer(from, to, tokenId);
     }

     function safeTransferFrom(address from, address to, uint tokenId) public {
         safeTransferFrom(from, to, tokenId, "");
     }

     function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) public {
         require(_isApprovedOrOwner(msg.sender, tokenId), "not approved or owner");
         _safeTransferFrom(from, to, tokenId, data);
    }

    function burn(uint tokenId) public virtual {
        require(_isApprovedOrOwner(msg.sender, tokenId), "not approved or owner");

        _burn(tokenId);
    }

    function _safeMint(address to, uint tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    function _safeMint(address to, uint tokenId, bytes memory data) internal virtual {
        require(_checkOnERC721Received(address(0), to, tokenId, data), "non-erc721 receiver");

        _mint(to, tokenId);
    }

    function _mint(address to, uint tokenId) internal virtual {
        require(to != address(0), "zero address to");
        require(!_exists(tokenId), "token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _owners[tokenId] = to;
        _balances[to]++;

        emit Transfer(address(0), to, tokenId);

        _afterTokenTransfer(address(0), to, tokenId);
    }

    function _burn(uint tokenId) internal virtual {
        address owner = ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        delete _tokenApprovals[tokenId];
        _balances[owner]--;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);

        _afterTokenTransfer(owner, address(0), tokenId);
    }

    function _transfer(address from, address to, uint tikenId) internal {
        require(ownerOf(tokenId) == from, "incorrect owner");
        require(to != address(0), "address to is zero");

        _beforeTokenTransfer(from, to, tokenId);

        delete _tokenApprovals[tokenId];
        _balances[from]--;
        _balances[to]++;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);

        _afterTokenTransfer(from, to, tokenId);
    }

    function _safeTransferFrom(address from, address to, uint tokenId, bytes memory data) internal {
        require(_checkOnERC721Received(from, to, tokenId, data), "transfer to non-erc721 receiver");

        _transfer(from, to, tokenId);
    }

    function _checkOnERC721Received(
        address from,
        address to,
        uint tokenId,
        bytes memory data
    ) private returns(bool) {
        if (to.code.length > 0) {
            try IERC721Receiver(to).onERC721Received(msg.sender, to, tokenId, data) returns(bytes4 result) {
                return result == IERC721Receiver.onERC721Received.selector;
            } catch(bytes memory reason) {
                if (reason.length == 0) {
                    revert("Transfer to non-erc721 receiver");
                } else {
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

    function _exists(tokenId) internal view returns(bool) {
        return _owners[tokenId] != address(0);
    }

    function _isApprovedOrOwner(address spender, uint tokenId) internal view returns(bool) {
        address owner = ownerOf(tokenId);

        return(
            spender == owner ||
            isApprovedForAll(owner, spender) ||
            getApproved(tokenId) == spender
        );
    }

    function _beforeTokenTransfer(address from, address to, uint tokenId) internal virtual {}
    function _afterTokenTransfer(address from, address to, uint tokenId) internal virtual {}
}
