uint224 entryRange = uint224(uint160(msg.sender));
entryRange |= ref.entryCount<<160;
entryRange |= (ref.entryCount + amount)<<192;
ref.raffleEntries.push(entryRange);
