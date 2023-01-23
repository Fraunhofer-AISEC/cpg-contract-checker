pragma solidity ^0.4.24;
import "./../mocks/BasicTokenMock.sol";
import "./restrictions/number-of-accounts/MaxNumShareholdersToken.sol";
import "./restrictions/ownership-percentage/IndividualOwnershipStakeToken.sol";

contract MyToken is BasicTokenMock, MaxNumShareholdersToken, IndividualOwnershipStakeToken {
    constructor (
        address initialAccount,
        uint256 initialBalance,
        uint256 maxNumShareholders,
        uint256 globalMaxPercentOwnershipTimesOneThousand
    )
    BasicTokenMock(initialAccount, initialBalance)
    MaxNumShareholdersToken(maxNumShareholders)
    IndividualOwnershipStakeToken(globalMaxPercentOwnershipTimesOneThousand)
    public {

    }
}
