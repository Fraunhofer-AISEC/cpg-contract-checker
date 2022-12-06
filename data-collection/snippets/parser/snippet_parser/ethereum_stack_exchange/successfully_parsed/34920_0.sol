contract Pacoin {
    
    mapping (address => uint256) public balanceOf;
    mapping (address => uint256) public vales;
    string public name;
    string public symbol;
    uint8 public decimals;
    address public pakos;

    

    function nPakoins() public constant returns (uint256 npakoins) {
        npakoins = balanceOf[msg.sender];
    }

    function nVales() public constant returns (uint256 nvales) {
        nvales = vales[msg.sender];
    }

}
