mapping(address => boolean) private _owners;
function _mint(address to, uint256 tokenId) internal virtual {
    require(!_owners(to), "This address already has a token");
    ...
}

function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
   require(!_owners(to), "This address already has a token");
   ...
}

