for (uint i = 0; i < _amount; i++) {
        uint mintIndex = totalSupply();
        _safeMint(msg.sender, mintIndex);
}
