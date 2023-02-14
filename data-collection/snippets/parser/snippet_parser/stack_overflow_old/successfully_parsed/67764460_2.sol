uint durationInSeconds = durationInDays * 1 days;



require(durationInSeconds / durationInDays == 1 days, 'Multiplication overflow');

uint raiseUntil = block.timestamp + durationInSeconds;



require(raiseUntil - block.timestamp == durationInSeconds, 'Addition overflow');
