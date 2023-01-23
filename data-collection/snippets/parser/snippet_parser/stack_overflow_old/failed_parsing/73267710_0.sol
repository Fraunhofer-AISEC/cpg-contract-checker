function registerCollection(address __collection) public {
        require(msg.sender == IERC721(__collection).owner), "Does not own contract");
        ...[rest of function]...
}
