
import "./PupperPass.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";





contract PupperPassCrowdsale is Crowdsale, MintedCrowdsale{ 
    
    
    constructor(
        uint256 rate,
        address payable wallet,
        PupCoin token
    ) public Crowdsale(rate, wallet, token) {

    }
}


contract PupCoinCrowdsaleDeployer {
    
    address public pupper_token_address;
    
    address public pupper_crowdsale_address;

    
    constructor(
       string memory name,
       string memory symbol,
       address payable wallet 
    ) public {
        
        PupCoin token = new PupCoin(name, symbol, 0);
        
        
        pupper_token_address = address(token);

        
        PupCoinCrowdsale pupper_crowdsale = 
            new PupCoinCrowdsale(1, wallet, token);
            
        
        pupper_crowdsale_address = address(pupper_crowdsale);
        
        
        token.addMinter(pupper_crowdsale_address);
        
        
        token.renounceMinter();
    }
}
