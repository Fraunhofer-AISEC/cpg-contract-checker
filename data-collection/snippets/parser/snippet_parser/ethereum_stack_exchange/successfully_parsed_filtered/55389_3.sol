contract StandardEvent is ERC223ReceivingContract, BaseContract, Ownable {
    using BytesLib for bytes;
    using ByteUtils for bytes32;
    using SafeMath for uint256;

    event TokenFallbackHit(
        uint256 indexed _number
    );
    event TokenFallbackParsed(
        bool indexed _success,
        address indexed _centralizedOracle,
        address indexed _resultSetter,
        uint8 _resultIndex
    );

    function tokenFallback(address _from, uint _value, bytes _data) external {
        emit TokenFallbackHit(1);

        bytes memory functionId = _data.slice(0, 4);
        bytes memory setResultFunc = hex"65f4ced1";
        bytes memory voteFunc = hex"6f02d1fb";

        emit TokenFallbackHit(2);

        address centralizedOracle = _data.toAddress(4);
        address resultSetter = _data.toAddress(24);
        uint8 resultIndex = uint8(_data.toUint(44));

        emit TokenFallbackHit(3);

        if (functionId.equal(setResultFunc)) {
            setResult(centralizedOracle, resultSetter, resultIndex, _value);
            emit TokenFallbackParsed(true, centralizedOracle, resultSetter, resultIndex);
        } else if (functionId.equal(voteFunc)) {
            vote(centralizedOracle, resultSetter, resultIndex, _value);
        } else {
            revert("Unhandled function in tokenFallback");
        }
    }
}