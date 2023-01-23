uint startTime = 9;
uint allowedTime = 7;

uint deadline = startTime + allowedTime;

require(now > deadline);
