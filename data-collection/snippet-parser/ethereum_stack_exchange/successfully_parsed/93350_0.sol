contract Factory is Ownable, AccessControl {

  ERC20PresetMinterPauser public token;

  bytes32 public constant CUSTODIAN_ROLE = keccak256("CUSTODIAN_ROLE");
  bytes32 public constant MERCHANT_ROLE = keccak256("MERCHANT_ROLE");

  enum RequestStatus {PENDING, CANCELED, APPROVED, REJECTED}

  mapping(bytes32=>uint) public mintRequestNonce;

  
  Request[] public mintRequests;
  Request[] public burnRequest;

  struct Request {
    address requester;
    uint amount;
    address depositAddress;
    string txid;
    uint nonce;
    uint timestamp;
    RequestStatus status;
  }

  constructor(address custodian, address merchant, address _token) {
    _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);

    _setupRole(CUSTODIAN_ROLE, custodian);
    _setupRole(MERCHANT_ROLE, merchant);

    token = ERC20PresetMinterPauser(_token);
  }

}