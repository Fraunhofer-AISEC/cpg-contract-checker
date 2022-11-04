function getKitty(uint256 id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
    ) {
    Kitty storage kit = kitties[id];


isGestating = (kit.siringWithId != 0);
isReady = (kit.cooldownEndBlock <= block.number);
cooldownIndex = uint256(kit.cooldownIndex);
nextActionAt = uint256(kit.cooldownEndBlock);
siringWithId = uint256(kit.siringWithId);
birthTime = uint256(kit.birthTime);
matronId = uint256(kit.matronId);
sireId = uint256(kit.sireId);
generation = uint256(kit.generation);
genes = kit.genes;
}
