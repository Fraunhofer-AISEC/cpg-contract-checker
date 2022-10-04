

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; 

contract VerificationTest {

    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
    }

    function checkIt () public {
        bytes memory witnessASignature = hex"8ee674e7c0105a914066d3554ee62a89f07a7a56ad5697695969b3219d8dc9da459d6f290db10b27a374010fb0abc5984dfeb8b380aa8f3564d4361217535e461b";
        bytes memory witnessBSignature = hex"8e474293656af3b93f36169062adeee942d0f2a5450d80110dcb8943863570a96312cdb64030ad3b12203755ac6a597798bede06667e95a7d3d5b3f3bed15b5e01";

        require(witnessASignature.length == 65, "invalid signature A length");
        require(witnessBSignature.length == 65, "invalid signature B length");

        bytes32 _ar;
        bytes32 _as;
        uint8 _av;

        assembly {
            _ar := mload(add(witnessASignature, 32))
            _as := mload(add(witnessASignature, 64))
            _av := byte(0, mload(add(witnessASignature, 96)))
        }

        bytes32 _br;
        bytes32 _bs;
        uint8 _bv;

        assembly {
            _br := mload(add(witnessBSignature, 32))
            _bs := mload(add(witnessBSignature, 64))
            _bv := byte(0, mload(add(witnessBSignature, 96)))
        }

        address witnessAAddress = 0x8809465617E09405a1af06C2d93C2bcE0Ce5Ac80;
        address witnessBAddress = 0x71eb10a6566cCA81Dd2892d36c55359AfedD3CFA;

        uint256 _amount = 10000000;
        string memory _externalAddress = "mi4VcxS4dsw9PzFAeTFJD17v2B7i24eMfQ";

        Assert.equal(ecrecover(prefixed(keccak256(abi.encodePacked(0xfCab1090e039D4B44c3862F46b7d55bC256AB041, _amount, _externalAddress, witnessAAddress))), _av, _ar, _as), witnessAAddress, "A not equal!");
        Assert.equal(ecrecover(prefixed(keccak256(abi.encodePacked(0xfCab1090e039D4B44c3862F46b7d55bC256AB041, _amount, _externalAddress, witnessBAddress))), _bv, _br, _bs), witnessBAddress, "B not equal!");
    }
}
