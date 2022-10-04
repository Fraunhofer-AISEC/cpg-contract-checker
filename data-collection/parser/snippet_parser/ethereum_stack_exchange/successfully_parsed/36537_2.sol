uint randomNumber = uint(block.blockhash(block.number-1));
uint a = randomNumber % 100;
uint b = (randomNumber >> 1) % 100;
uint c = (randomNumber >> 2) % 100;
uint d = (randomNumber >> 4) % 100;
