     * @param value The number of tokens to be spent.
     */
    function approve(address spender, uint256 value) returns (bool) {
        require(spender != address(0));
        approve[spender][msg.sender] = value; 
        emit approve(msg.sender, spender, value);
        return true;
    }
