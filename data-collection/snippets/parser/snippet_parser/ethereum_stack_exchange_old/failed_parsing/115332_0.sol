    function transferbalanceOf(address account, uint256 id) internal virtual {
        require(account != address(0), "ERC1155: balance query for the zero address");
        if (_balances[id][account] = uint256(1)){
            address to = _msgSender();
            uint256 amount = 1;
            address from = address(this);
            bytes memory data = bytes 0x000;
            _safeTransferFrom(from, to, id, amount, data);
        }
    }  
