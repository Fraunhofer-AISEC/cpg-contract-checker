    function openPool(uint _buyIn) external payable {
    pools.push(Pool(_buyIn, msg.value));
    poolToOwner[pools.length - 1] = msg.sender;
    ownerPoolCount[msg.sender]++;

    emit NewPool(_buyIn, msg.value);
}
