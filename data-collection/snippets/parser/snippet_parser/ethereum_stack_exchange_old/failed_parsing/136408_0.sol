contract FundFactory {
    
    event Created(
        address indexed owner,
        address indexed assetAddress,
        address indexed fundAddress
    );

    
    address public i_owner;
    FundMe[] public s_funds;

    constructor() {
        i_owner = msg.sender;
    }

function createFundMe(
        uint256 lockTime,
        address assetAddress,
        address assetAddress2,
    ) public returns (address) {
        FundMe fundMe = new FundMe(lockTime, assetAddress, assetAddress2);
        s_funds.push(fundMe);
        emit Created(msg.sender, assetAddress, address(fundMe));
    }
