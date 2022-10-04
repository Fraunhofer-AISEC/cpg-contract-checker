for (uint idx = 0; idx < v.length; idx++){
            address signer = ecrecover(signedHash, v[idx], r[idx], s[idx]);
            require(admins[signer]);
            require(uint256(signer) > uint256(lastVoter));
            lastVoter = signer;
            emit NewCheckpointVote(_sectionIndex, _hash, v[idx], r[idx], s[idx]);

            
            if (idx+1 >= threshold){
                hash = _hash;
                height = block.number;
                sectionIndex = _sectionIndex;
                return true;
            }
        }
        
        revert();
    }
