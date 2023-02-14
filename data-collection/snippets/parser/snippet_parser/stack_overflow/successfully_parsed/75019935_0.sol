import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract SignatureChecker is EIP712 {
    using ECDSA for bytes32;

    struct Fee {
        address recipient;
        uint256 value;
    }

    struct Request {
        address to;
        address from;
        Fee[] fees;
    }

    bytes32 public TYPEHASH = keccak256("Request(address to,address from, Fee[] fees)");

    constructor() EIP712("SignatureChecker", "1") {}

    function verify(
        Request calldata request,
        bytes calldata signature,
        address supposedSigner
    ) external view returns (bool) {
        return recoverAddress(request, signature) == supposedSigner;
    }

    function recoverAddress(
        Request calldata request,
        bytes calldata signature
    ) public view returns (address) {
        return _hashTypedDataV4(keccak256(encodeRequest(request))).recover(signature);
    }

    function encodeRequest(Request calldata request) public view returns (bytes memory) {
        return abi.encode(TYPEHASH, request.to, request.from, request.fees);
    }
}
