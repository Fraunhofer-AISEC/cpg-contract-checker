 function createViper(
    uint256 matron,
    uint256 sire,
    address viperOwner
)
    internal
    returns (uint)
{
    require(viperOwner != address(0));
    uint8 newGenes = generateViperGenes(matron, sire);
    Viper memory newViper = Viper({
        genes: newGenes,
        matronId: matron,
        sireId: sire
    });
    uint256 newViperId = vipers.push(newViper).sub(1);
    super._mint(viperOwner, newViperId);
    emit Birth(
        viperOwner,
        newViperId,
        newViper.matronId,
        newViper.sireId,
        newViper.genes
    );
    return newViperId;
}
