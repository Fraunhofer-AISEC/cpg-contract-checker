uint256 MAX_TIME = 365 days;
uint256 Duration1 = 223 days;
uint256 Duration2 = 142 days;
uint256 amount = 100e18; 

uint256 amount1 = amount.mul(Duration1).div(MAX_TIME); 
uint256 amount2 = amount.mul(Duration2).div(MAX_TIME); 

