pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./oraclizeAPI.sol";

interface EtherHiLoRandomNumberRequester {

    function incomingRandomNumber(address player, uint8 randomNumber) external;

    function incomingRandomNumberError(address player) external;

}

interface EtherHiLoRandomNumberGenerator {

        function generateRandomNumber(address player, uint8 max) external returns (bool);

    }

    
    
    contract EtherHiLoRandom is usingOraclize, Ownable, EtherHiLoRandomNumberGenerator {

        uint8 constant FAILED_ROLE = 69;

        uint public rngCallbackGas;

        mapping(bytes32 => uint) private failedRolls;
        mapping(bytes32 => address) private rollIdToPlayer;
        mapping(bytes32 => uint8) private rollIdToMax;
        mapping(bytes32 => address) private rollIdToCaller;

        constructor() public {
            oraclize_setProof(proofType_Ledger);
            setRNGCallbackGasConfig(1500000, 10000000000);
        }

        function generateRandomNumber(address player, uint8 max) external returns (bool) {

            bytes32 rollId = oraclize_newRandomDSQuery(0, 7, rngCallbackGas);
            if (failedRolls[rollId] == FAILED_ROLE) {
                delete failedRolls[rollId];
                delete rollIdToPlayer[rollId];
                delete rollIdToMax[rollId];
                delete rollIdToCaller[rollId];
                return false;
            }

            rollIdToPlayer[rollId] = player;
            rollIdToMax[rollId] = max;
            rollIdToCaller[rollId] = msg.sender;
            return true;
        }

        function __callback(bytes32 rollId, string _result, bytes _proof) public {
            require(msg.sender == oraclize_cbAddress());

            address player = rollIdToPlayer[rollId];
            address caller = rollIdToCaller[rollId];
            uint8 max = rollIdToMax[rollId];

            
            if (player == address(0)) {
                failedRolls[rollId] = FAILED_ROLE;
                return;
            }

            delete failedRolls[rollId];
            delete rollIdToPlayer[rollId];
            delete rollIdToMax[rollId];
            delete rollIdToCaller[rollId];

            EtherHiLoRandomNumberRequester requester = EtherHiLoRandomNumberRequester(caller);

            if (oraclize_randomDS_proofVerify__returnCode(rollId, _result, _proof) != 0) {
                requester.incomingRandomNumberError(player);

            } else {
                uint8 randomNumber = uint8(uint(keccak256(_result)) % max);
                requester.incomingRandomNumber(player, randomNumber);
            }
        }


        

        function transferBalance(address to, uint amount) public onlyOwner {
            to.transfer(amount);
        }

        function setRNGCallbackGasConfig(uint gas, uint price) public onlyOwner {
            rngCallbackGas = gas;
            oraclize_setCustomGasPrice(price);
        }

        function destroyAndSend(address _recipient) public onlyOwner {
            selfdestruct(_recipient);
        }

    }
