contract class24{
    function get_time_now()public view returns(uint256,uint256){
        return (now,block.timestamp);
    }
    function get_block_info()public view returns(uint blockNumber,bytes32 blockHash,uint256  blockDifficulty){

        return (block.number,
                blockhash(block.number-1),
                block.difficulty);
    }
    function get_tx_info()public view returns(address msgSender,address origin,uint value){
        return (msg.sender,
                tx.origin,
                msg.value);
    }
    event setMoney (uint money);

    function buy () public payable {
        emit setMoney(msg.value);
    }
}
