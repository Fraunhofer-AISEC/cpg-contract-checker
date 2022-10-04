function getSummary() public view returns (uint, uint, uint, address, bool) {
    return (
        reward,
        choices.length,
        votersCount,
        manager,
        pollActive
    );
}
