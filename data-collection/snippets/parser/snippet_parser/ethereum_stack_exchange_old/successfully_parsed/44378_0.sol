  contract Account {
    mapping (address => uint) balance;

            function accept(uint postId) payable public {
                balance[msg.sender] += msg.value;
                uint beforeWeight = posts[postId].weight;
            }
}