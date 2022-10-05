function create(
    address staking,
    address reward,
    bytes calldata stakingdata,
    bytes calldata rewarddata
) external returns (address) {
    
    require(whitelist[staking] == ModuleFactoryType.Staking, "f1");
    require(whitelist[reward] == ModuleFactoryType.Reward, "f2");

    
    address stakingModule =
        IModuleFactory(staking).createModule(stakingdata);
    address rewardModule = IModuleFactory(reward).createModule(rewarddata);

    
    Pool pool = new Pool(stakingModule, rewardModule, _gysr, address(this));

    
    IStakingModule(stakingModule).transferOwnership(address(pool));
    IRewardModule(rewardModule).transferOwnership(address(pool));
    pool.transferControl(msg.sender); 
    pool.transferOwnership(msg.sender);

    
    map[address(pool)] = true;
    list.push(address(pool));

    
    emit PoolCreated(msg.sender, address(pool));
    return address(pool);
}
