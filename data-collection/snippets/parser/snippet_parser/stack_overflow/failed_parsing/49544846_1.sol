Fish[] fishies;

function releaseFish(
    uint128 _id,
    uint32 _category,
)
    returns (uint)
{
    Fish memory _fish = Fish({
        id: _id,
        category: _category
    });

    uint256 newFishId = fishies.push(_fish) - 1;
    Release(
        newFishId,
        uint128(_id),
        uint32(_category)
    );
}
