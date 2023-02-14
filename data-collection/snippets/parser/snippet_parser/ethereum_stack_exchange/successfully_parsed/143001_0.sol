function performLoop() nonReentrant external {
    (bool canExecute, ) = requiresExecution(false);
    require(canExecute, "PEL: Nothing to Execute");
    uint gasAtStart = gasleft();


    uint256 gasSpent = gasAtStart - gasleft() + 28925;
    try payable(msg.sender).transfer((gasSpent * tx.gasprice) + (gasSpent * (tx.gasprice/10))) { } catch { }
}
