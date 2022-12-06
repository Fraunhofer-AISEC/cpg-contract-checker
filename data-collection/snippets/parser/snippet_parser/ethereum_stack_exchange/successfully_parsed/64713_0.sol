contract sendEther{

    address payable rec= address(0xD694fab8b63BeF0149aa47b8333dFeAe7f55E9C7);
    address public reciever;


    function send() public payable{

        rec.transfer(msg.value);

    }
}
