uint64 configCount = s_configCount;
s_hotVars.latestConfigDigest = configDigestFromConfigData(address(this),configCount,_signers,_transmitters,_threshold,_encodedConfigVersion,_encoded);
s_hotVars.latestEpochAndRound = 0;
