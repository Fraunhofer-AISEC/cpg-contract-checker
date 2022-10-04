    interface IAaveLendingPool {
    function deposit(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode
    ) external;

    function withdraw(
        address asset,
        uint256 amount,
        address to
    ) external;

    function getReservesList() external view returns (address[] memory);
}

aAveLendingPool= IAaveLendingPool(0x0543958349aAve_pooladdress)
