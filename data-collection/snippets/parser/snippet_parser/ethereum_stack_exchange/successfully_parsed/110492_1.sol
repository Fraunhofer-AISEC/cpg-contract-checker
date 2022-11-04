function updateStakingPool() internal {
    uint256 length = poolInfo.length;
    uint256 points = 0;
    for (uint256 pid = 1; pid < length; ++pid) {
        points = points.add(poolInfo[pid].allocPoint);
    }
    if (points != 0) {
        points = points.div(3);
        totalAllocPoint = totalAllocPoint.sub(poolInfo[0].allocPoint).add(points);
        poolInfo[0].allocPoint = points;
    }
}
