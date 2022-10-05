uint256 PRECISION = 1e18;

uint256 amount1 = amount.mul(Duration1).mul(PRECISION).div(MAX_TIME); 
uint256 amount2 = amount.mul(Duration2).mul(PRECISION).div(MAX_TIME); 


uint256 back =  amount1.mul(MAX_TIME).div(Duration1).div(PRECISION) + amount2.mul(MAX_TIME).div(Duration2).div(PRECISION);

