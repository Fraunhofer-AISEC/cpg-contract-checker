contract PostDeliveryCrowdsale is TimedCrowdsale {
    using SafeMath for uint256;

    mapping(address => uint256) private _balances;   <--- I want to access this variable
