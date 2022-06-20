pragma solidity >=0.5.0 <0.7.0;
pragma experimental ABIEncoderV2;



contract Process {
    struct Process {
        uint256[] tokens;
        bytes32 learning;
    }

    mapping(uint256 => Process[]) private processes;

    function _newProcess(uint256 _tokenId, uint256[] memory _tokens, bytes32 _learning) private {
        uint256 step = processes[_tokenId].length;
        Process memory process = Process({ tokens: _tokens, learning: _learning });

        processes[_tokenId].push(process);
        emit newProcessAdded(_tokenId, step, _tokens, _learning);
    }

    function getAllTokenProcess(uint256 _tokenId) public view returns (Process[] memory) {
        return processes[_tokenId];
    }

    function getTokenProcess(uint256 _tokenId, uint256 _step) public view returns (uint256[] memory, bytes32) {
        Process memory process = processes[_tokenId][_step];
        return (process.tokens, process.learning);
    }

}
