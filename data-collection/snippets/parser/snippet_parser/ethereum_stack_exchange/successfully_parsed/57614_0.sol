function add(address owner, uint arg1, uint arg2, uint arg3) external {
    ownerToItems[owner].push(Item(arg1, arg2, arg3));
}
