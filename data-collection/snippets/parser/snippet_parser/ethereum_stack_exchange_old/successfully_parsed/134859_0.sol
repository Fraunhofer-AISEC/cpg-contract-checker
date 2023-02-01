
pragma solidity ^0.8.0;

pragma experimental ABIEncoderV2;


interface IOffchainOracle {

    function getRate(
        address srcToken,
        address dstToken,
        bool useWrappers
    ) external view returns (uint256);

    function getRateToEth(address srcToken, bool useSrcWrappers) external view returns (uint256);

}

contract OneInchOracleQuery {

    function getRatesToEth(address[] calldata _tokens, address _oracle) external view returns (uint256[] memory){
        uint256[] memory result = new uint256[](_tokens.length);
        IOffchainOracle offChainOracle = IOffchainOracle(_oracle);
        for (uint i = 0; i < _tokens.length; i++){
            result[i] = offChainOracle.getRateToEth(_tokens[i], false);
        }
        return result;
    }
}
