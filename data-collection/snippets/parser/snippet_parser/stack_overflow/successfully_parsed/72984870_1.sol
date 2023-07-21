import "./IExchangeRate.sol";

abstract contract SelfFunding {
    uint256 constant TINY_PARTS_PER_WHOLE = 100_000_000;
    address constant PRECOMPILE_ADDRESS = address(0x168);

    function tinycentsToTinybars(uint256 tinycents) internal returns (uint256 tinybars) {
        (bool success, bytes memory result) = PRECOMPILE_ADDRESS.call(
            abi.encodeWithSelector(IExchangeRate.tinycentsToTinybars.selector, tinycents));
        require(success);
        tinybars = abi.decode(result, (uint256));
    }

    modifier costsCents(uint256 cents) {
        uint256 tinycents = cents * TINY_PARTS_PER_WHOLE;
        uint256 requiredTinybars = tinycentsToTinybars(tinycents);
        require(msg.value >= requiredTinybars);
        _;
    } 
}
