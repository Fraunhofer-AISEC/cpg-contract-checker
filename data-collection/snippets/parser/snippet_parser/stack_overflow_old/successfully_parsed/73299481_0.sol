import {IERC721Enumerable} from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";


contract LensHub is
  LensNFTBase,
  VersionedInitializable,
  LensMultiState,
  LensHubStorage,
  ILensHub
{
  uint256 internal constant REVISION = 1;

  address internal immutable FOLLOW_NFT_IMPL;
  address internal immutable COLLECT_NFT_IMPL;

  
  modifier onlyGov() {
    _validateCallerIsGovernance();
    _;
  }

  
  constructor(address followNFTImpl, address collectNFTImpl) {
    if (followNFTImpl == address(0)) revert Errors.InitParamsInvalid();
    if (collectNFTImpl == address(0)) revert Errors.InitParamsInvalid();
    FOLLOW_NFT_IMPL = followNFTImpl;
    COLLECT_NFT_IMPL = collectNFTImpl;
  }

  
  function initialize(
    string calldata name,
    string calldata symbol,
    address newGovernance
  ) external override initializer {
    super._initialize(name, symbol);
    _setState(DataTypes.ProtocolState.Paused);
    _setGovernance(newGovernance);
  }
}