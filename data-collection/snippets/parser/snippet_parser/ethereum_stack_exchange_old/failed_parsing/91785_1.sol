import "@openZeppeline/ERC20"
contract ERC20Token is ERC20 {
....
function allowance(address owner, address spender) public view virtual override returns (uint256) {
        super.allowance(owner,spender);
    }
 }
