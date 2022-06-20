    mapping(address => uint256) public balanceOf;

    function () payable public {
              uint amount = msg.value;
              balanceOf[msg.sender] += amount;
        }
