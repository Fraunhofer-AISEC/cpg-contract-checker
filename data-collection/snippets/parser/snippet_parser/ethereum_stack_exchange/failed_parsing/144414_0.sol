uint256 internal constant TOKENS_IN_POOL = 1_000_000e18;
address payable internal attacker;
bytes memory approvePaylaod = abi.encodeWithSignature("approve(address,uint256)",address(attacker),TOKENS_IN_POOL);

address payable addressAttacker;
uint256 num;
(addressAttacker,num) = abi.decode(approvePaylaod, (address,uint256));
