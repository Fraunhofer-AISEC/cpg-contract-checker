 function functionName(uint256 param1, address param2)
        external
        override
    {
        require(msg.sender == marketContract, "only market contract");
}