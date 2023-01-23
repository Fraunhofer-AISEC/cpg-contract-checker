
pragma solidity ^0.8.1;


library AddressUpgradeable {
  
    function isContract(address account) internal view returns (bool) {
        
        
        

        return account.code.length > 0;
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

   
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

   
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

   
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

   
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResult(success, returndata, errorMessage);
    }

    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            
            if (returndata.length > 0) {
                

                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}






pragma solidity ^0.8.0;
abstract contract Initializable {
    
    bool private _initialized;

    
    bool private _initializing;

    
    modifier initializer() {
        
        
        
        require(_initializing ? _isConstructor() : !_initialized, "Initializable: contract is already initialized");

        bool isTopLevelCall = !_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }

        _;

        if (isTopLevelCall) {
            _initializing = false;
        }
    }

    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }

    function _isConstructor() private view returns (bool) {
        return !AddressUpgradeable.isContract(address(this));
    }
}

pragma solidity ^0.8.0;


abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal onlyInitializing {
    }

    function __Context_init_unchained() internal onlyInitializing {
    }
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

   
    uint256[50] private __gap;
}






pragma solidity ^0.8.0;


abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    
    function __Ownable_init() internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __Ownable_init_unchained() internal onlyInitializing {
        _transferOwnership(_msgSender());
    }

    
    function owner() public view virtual returns (address) {
        return _owner;
    }

    
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }


    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }


    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }


    uint256[49] private __gap;
}






pragma solidity ^0.8.0;

interface IERC20Upgradeable {
    
    function totalSupply() external view returns (uint256);

    
    function balanceOf(address account) external view returns (uint256);


    function transfer(address to, uint256 amount) external returns (bool);


    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);


    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);


    event Approval(address indexed owner, address indexed spender, uint256 value);
}

library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    
    function toString(uint256 value) internal pure returns (string memory) {
       

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}



library ECDSA {
    enum RecoverError {
        NoError,
        InvalidSignature,
        InvalidSignatureLength,
        InvalidSignatureS,
        InvalidSignatureV
    }

    function _throwError(RecoverError error) private pure {
        if (error == RecoverError.NoError) {
            return; 
        } else if (error == RecoverError.InvalidSignature) {
            revert("ECDSA: invalid signature");
        } else if (error == RecoverError.InvalidSignatureLength) {
            revert("ECDSA: invalid signature length");
        } else if (error == RecoverError.InvalidSignatureS) {
            revert("ECDSA: invalid signature 's' value");
        } else if (error == RecoverError.InvalidSignatureV) {
            revert("ECDSA: invalid signature 'v' value");
        }
    }


    function tryRecover(bytes32 hash, bytes memory signature) internal pure returns (address, RecoverError) {
      
        if (signature.length == 65) {
            bytes32 r;
            bytes32 s;
            uint8 v;
            
            
            assembly {
                r := mload(add(signature, 0x20))
                s := mload(add(signature, 0x40))
                v := byte(0, mload(add(signature, 0x60)))
            }
            return tryRecover(hash, v, r, s);
        } else if (signature.length == 64) {
            bytes32 r;
            bytes32 vs;
            
            
            assembly {
                r := mload(add(signature, 0x20))
                vs := mload(add(signature, 0x40))
            }
            return tryRecover(hash, r, vs);
        } else {
            return (address(0), RecoverError.InvalidSignatureLength);
        }
    }

    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        (address recovered, RecoverError error) = tryRecover(hash, signature);
        _throwError(error);
        return recovered;
    }


    function tryRecover(
        bytes32 hash,
        bytes32 r,
        bytes32 vs
    ) internal pure returns (address, RecoverError) {
        bytes32 s = vs & bytes32(0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        uint8 v = uint8((uint256(vs) >> 255) + 27);
        return tryRecover(hash, v, r, s);
    }

    function recover(
        bytes32 hash,
        bytes32 r,
        bytes32 vs
    ) internal pure returns (address) {
        (address recovered, RecoverError error) = tryRecover(hash, r, vs);
        _throwError(error);
        return recovered;
    }

    function tryRecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal pure returns (address, RecoverError) {
        
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return (address(0), RecoverError.InvalidSignatureS);
        }
        if (v != 27 && v != 28) {
            return (address(0), RecoverError.InvalidSignatureV);
        }

        
        address signer = ecrecover(hash, v, r, s);
        if (signer == address(0)) {
            return (address(0), RecoverError.InvalidSignature);
        }

        return (signer, RecoverError.NoError);
    }

 
    function recover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal pure returns (address) {
        (address recovered, RecoverError error) = tryRecover(hash, v, r, s);
        _throwError(error);
        return recovered;
    }


    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {
        
        
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }


    function toEthSignedMessageHash(bytes memory s) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n", Strings.toString(s.length), s));
    }


    function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19\x01", domainSeparator, structHash));
    }
}







abstract contract EIP712 {
    
    
    
    bytes32 private immutable _CACHED_DOMAIN_SEPARATOR;
    uint256 private immutable _CACHED_CHAIN_ID;
    address private immutable _CACHED_THIS;

    bytes32 private immutable _HASHED_NAME;
    bytes32 private immutable _HASHED_VERSION;
    bytes32 private immutable _TYPE_HASH;

    constructor(string memory name, string memory version) {
        bytes32 hashedName = keccak256(bytes(name));
        bytes32 hashedVersion = keccak256(bytes(version));
        bytes32 typeHash = keccak256(
            "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
        );
        _HASHED_NAME = hashedName;
        _HASHED_VERSION = hashedVersion;
        _CACHED_CHAIN_ID = block.chainid;
        _CACHED_DOMAIN_SEPARATOR = _buildDomainSeparator(typeHash, hashedName, hashedVersion);
        _CACHED_THIS = address(this);
        _TYPE_HASH = typeHash;
    }

    function _domainSeparatorV4() internal view returns (bytes32) {
        if (address(this) == _CACHED_THIS && block.chainid == _CACHED_CHAIN_ID) {
            return _CACHED_DOMAIN_SEPARATOR;
        } else {
            return _buildDomainSeparator(_TYPE_HASH, _HASHED_NAME, _HASHED_VERSION);
        }
    }

    function _buildDomainSeparator(
        bytes32 typeHash,
        bytes32 nameHash,
        bytes32 versionHash
    ) private view returns (bytes32) {
        return keccak256(abi.encode(typeHash, nameHash, versionHash, block.chainid, address(this)));
    }


    function _hashTypedDataV4(bytes32 structHash) internal view virtual returns (bytes32) {
        return ECDSA.toTypedDataHash(_domainSeparatorV4(), structHash);
    }
}


contract whitelistChecker is EIP712 {

    string private constant SIGNING_DOMAIN = "Azo_Staking";
    string private constant SIGNATURE_VERSION = "1";

     struct Whitelist {
        address userAddress;
        address contractAddress;
        uint256 amount;
        uint256 id;
        uint256 noOfDays ;
        uint256 timestamp;
        bytes signature;
    }
    constructor() EIP712(SIGNING_DOMAIN, SIGNATURE_VERSION){

    }

    function getSigner(Whitelist memory whitelist) public view returns(address){
        return _verify(whitelist);
    }

    

function _hash(Whitelist memory whitelist) internal view returns (bytes32) {
        return _hashTypedDataV4(keccak256(abi.encode(
                keccak256("Whitelist(address userAddress,address contractAddress,uint256 amount,uint256 id,uint256 noOfDays,uint256 timestamp)"),
                whitelist.userAddress,
                whitelist.contractAddress,
                whitelist.amount,
                whitelist.id,
                whitelist.noOfDays,
                whitelist.timestamp
            )));
    }
    function _verify(Whitelist memory whitelist) internal view returns (address) {
        bytes32 digest = _hash(whitelist);
        return ECDSA.recover(digest, whitelist.signature);
    }

}



contract DoxaStake is OwnableUpgradeable,whitelistChecker{

    IERC20Upgradeable public stakeToken;
    IERC20Upgradeable public rewardToken;

    uint256 private _totalSupply;
    address public signer;
    uint256 public givenRewards;

    uint256 public totalRewardFunds;
    uint256 public rewardBalance = totalRewardFunds;

    uint day = 60;
    uint accuracyFactor = 10 ** 10;

    mapping(address => uint256) public totalStakeRecords;
    mapping(address => mapping (uint => bool)) private usedNonce;
    mapping(address => stakerDetails[]) public Stakers;
    mapping(address=>bool) public isBlocklisted;
       modifier isblocklist(address _addr){
        require(!isBlocklisted[_addr],"wallet is blocklisted");
        _;
    }

      struct stakerDetails {
        uint id;
        uint balance;
        uint totalRewards;
        uint lockingPeriod;
        uint lastUpdatedTime;
        uint maxTime;
        uint rewardEarned;
        uint rewardPaidOut;
        uint apr;
    }

    event RewardAdded(uint256 reward);
    event Staked(address indexed user, uint256 amount, uint256 noOfDays);
    event Unstaked(address indexed user, uint256 amount);
    event RewardPaid(address indexed user, uint256 reward);
    event RecoverToken(address indexed token, uint256 indexed amount);
    modifier updateReward(address account, uint id) {
        Stakers[account][id].rewardEarned = earned(account, id);
        _;
    }

    function getRewardRate(address account, uint id) public view returns (uint256) {
        uint daysInTimestamp = Stakers[account][id].lockingPeriod * day;

        uint amount = getAmountWithApr(account, id);

        return (amount*(Stakers[account][id].lockingPeriod))/(daysInTimestamp*(365));
    }

    function getAmountWithApr(address account, uint id) internal view returns(uint) {
        return ((Stakers[account][id].balance) * (Stakers[account][id].apr))/(100 *accuracyFactor);
    }

    function earned(address account, uint id) public view returns (uint256) {
        if(Stakers[account][id].rewardPaidOut < Stakers[account][id].totalRewards) {
            if(block.timestamp >= Stakers[account][id].maxTime) {
              return (Stakers[account][id].totalRewards)-(Stakers[account][id].rewardPaidOut);
            }

            return
               (getRewardRate(account, id)) * ((block.timestamp)-(Stakers[account][id].lastUpdatedTime));
        } else {
            return 0;
        } 
    }

    function isRewardAvailable(uint rewardAmount) public view returns (bool) {
        if(rewardBalance >= rewardAmount) {
            return true;
        }
        return false;
    }

    function getAPR(uint noOfDays) public view returns(uint) {
         require(noOfDays <=365,"Only 1 year");
      return ((noOfDays * (5 * (noOfDays * accuracyFactor)) /(10000)) + (50 * accuracyFactor));
    }

    function rewardForPeriod(uint amount, uint noOfDays) public view returns (uint) {
         require(noOfDays <=365,"Only 1 year");
        uint apr = getAPR(noOfDays);
        uint reward = (amount *apr)/((100) * (accuracyFactor));
        uint totalRewardForPeriod = (reward/365) *(noOfDays);
        require(isRewardAvailable(totalRewardForPeriod), "Not enought reward available");
        return totalRewardForPeriod;
    }

    function stake(uint256 amount, uint noOfDays,  Whitelist memory stakeo) external isblocklist(msg.sender){
        require(noOfDays <=365,"Only 1 year");
        require(!usedNonce[msg.sender][stakeo.timestamp],"Nonce : Invalid Nonce");
        require (getSigner(stakeo) == signer,'!Signer');
        usedNonce[msg.sender][stakeo.timestamp] = true;
        require(amount > 0, "Cannot stake 0");
        stakerDetails memory staker;

        uint daysInTimestamp = noOfDays * day;

        uint rewardForUser = rewardForPeriod(amount, noOfDays);
        totalStakeRecords[msg.sender] += 1;
        staker.id = totalStakeRecords[msg.sender];
        staker.lockingPeriod = noOfDays;
        staker.totalRewards = rewardForUser;
        staker.lastUpdatedTime = block.timestamp;
        staker.maxTime = block.timestamp + (daysInTimestamp);
        staker.balance = amount;
        staker.apr = getAPR(noOfDays);

        Stakers[msg.sender].push(staker);
        rewardBalance -= rewardForUser;
        _totalSupply +=amount;
        stakeToken.transferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount, noOfDays);
    }

    function unstake(uint id, Whitelist memory stakeo) internal {
        require(!usedNonce[msg.sender][stakeo.timestamp],"Nonce : Invalid Nonce");
        require (getSigner(stakeo) == signer,'!Signer');
        usedNonce[msg.sender][stakeo.timestamp] = true;
        require(block.timestamp >= Stakers[msg.sender][id].maxTime, "Tokens are locked! Try unstaking after locking period");
        uint amount = Stakers[msg.sender][id].balance;
        _totalSupply -=amount;
        Stakers[msg.sender][id].balance = 0;
        stakeToken.transfer(msg.sender, amount);
        emit Unstaked(msg.sender, amount);
    }


    function getReward(uint id,Whitelist memory stakeo) external  updateReward(msg.sender, id) isblocklist(msg.sender){
        require(!usedNonce[msg.sender][stakeo.timestamp],"Nonce : Invalid Nonce");
        require (getSigner(stakeo) == signer,'!Signer');
        usedNonce[msg.sender][stakeo.timestamp] = true;
        uint256 reward = earned(msg.sender, id);
        require(reward>0,"no Rewards Available");
        Stakers[msg.sender][id].lastUpdatedTime = block.timestamp;
        if (reward > 0) {
            Stakers[msg.sender][id].rewardEarned = 0;
            Stakers[msg.sender][id].rewardPaidOut += reward;
            givenRewards+=reward;
            rewardToken.transfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
    }

     function exit(uint id,Whitelist memory stakeo) external isblocklist(msg.sender){
        require(!usedNonce[msg.sender][stakeo.timestamp],"Nonce : Invalid Nonce");
        require (getSigner(stakeo) == signer,'!Signer');
        usedNonce[msg.sender][stakeo.timestamp] = true;
        require(block.timestamp >= Stakers[msg.sender][id].maxTime, "Tokens are locked! Try unstaking after locking period");
         uint amount = Stakers[msg.sender][id].balance;
        require(amount>0,"No staked Balance");
        uint256 reward = earned(msg.sender, id);
        Stakers[msg.sender][id].lastUpdatedTime = block.timestamp;
        if (reward > 0) {
            Stakers[msg.sender][id].rewardEarned = 0;
            givenRewards+=reward;
            Stakers[msg.sender][id].rewardPaidOut += reward;
            rewardToken.transfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
         _totalSupply -=amount;
        Stakers[msg.sender][id].balance = 0;
        stakeToken.transfer(msg.sender, amount);
          emit Unstaked(msg.sender, amount);
    }


    function TotalValueLocked() public view returns (uint256) {
        return _totalSupply;
    }

    function setsigner(address _addr) external onlyOwner{
        signer=_addr;
    }

    function balanceOf(address account, uint id) public view returns (uint256) {
        return Stakers[account][id].balance;
    }

    function recoverExcessToken(address token, uint256 amount) external onlyOwner {
        IERC20Upgradeable(token).transfer(msg.sender, amount);
        emit RecoverToken(token, amount);
    }

    function depositRewards(uint amount) public onlyOwner {
        stakeToken.transferFrom(msg.sender, address(this), amount);
        totalRewardFunds += amount;
        rewardBalance += amount;
    }
    function TotalRewards() public view returns(uint256){
        uint256 tRewards = totalRewardFunds - rewardBalance;
        return tRewards;
    }
    
    function blocklistUsers(address _addr) external onlyOwner{
        isBlocklisted[_addr]=true;
    }
    function unblockUsers(address _addr) external onlyOwner{
         isBlocklisted[_addr]=false;
    }
    function initialize(address _stakeToken, address _RewardToken) external initializer{
          stakeToken=IERC20Upgradeable(_stakeToken);
          rewardToken=IERC20Upgradeable(_RewardToken);
              __Ownable_init();
           signer=msg.sender;
    }
    function setTokens(address _addr) external onlyOwner{
         stakeToken=IERC20Upgradeable(_addr);
         rewardToken=IERC20Upgradeable(_addr);
    }

}
