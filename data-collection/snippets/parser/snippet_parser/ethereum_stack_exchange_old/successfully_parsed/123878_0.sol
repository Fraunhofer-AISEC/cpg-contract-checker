mapping (address => bool) isExemptFromFees;
address[] private eligibleForLotto;
    
function _transferNormal(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(!isPaused, "Transfers are paused, check official announcements for info");
        require(amount <= maxSupply / 200, "Tx amount cant be more than 0.5% of total supply");
        
            (uint _tAmount, uint _dFee, uint _mFee, uint _lFee) = getTaxAmount(amount);
            require(_balances[recipient] + _tAmount <= maxSupply / 100, "Cant hold more than 1% of maxSupply");

            uint256 senderBalance = _balances[sender];
            require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
            unchecked {
                _balances[sender] = senderBalance - amount;
            }
            _balances[recipient] += _tAmount;
            _balances[devWallet] += _dFee;
            _balances[managementWallet] += _mFee;
            _balances[address(this)] += _lFee;

            emit Transfer(sender, recipient, _tAmount);
            emit Transfer(sender, devWallet, _dFee);
            emit Transfer(sender, managementWallet, _mFee);
            emit Transfer(sender, address(this), _lFee);

            if (!isExemptFromFees[sender] && _balances[sender] < holdRequirementForLottoEligibility) {           
                for (uint i = 0; i < eligibleForLotto.length; i++) {
                    if (eligibleForLotto[i] == sender) {
                        eligibleForLotto[i] = eligibleForLotto[eligibleForLotto.length - 1];
                        eligibleForLotto.pop();
                            break;
                    }
                }
            }

            if (!isExemptFromFees[recipient] && _balances[recipient] >= holdRequirementForLottoEligibility) { 
                bool exists;
                for (uint i = 0; i < eligibleForLotto.length; i++) {
                    if (eligibleForLotto[i] == recipient){
                        exists = true;
                        break;
                    }  
                }
                if (!exists) {
                    eligibleForLotto.push(recipient);
                }
            }

            if (lotteryEnabled) {
                txCounter++;
                if (txCounter == txNumForDraw) {
                    uint jackpot = _balances[address(this)];
                    uint modulus = eligibleForLotto.length * 2;
                    uint rand = uint(keccak256(abi.encodePacked(block.timestamp + _tAmount + jackpot)));
                    uint lottoResult = rand % modulus;

                    if (lottoResult > eligibleForLotto.length) { 
                        txCounter = 0; 
                    } else { 
                    address winner = eligibleForLotto[lottoResult]; 
                    _balances[address(this)] -= jackpot;
                    _balances[winner] += jackpot;
                    emit Transfer(address(this), winner, jackpot);
                    }
                }
            }
     txCounter = 0;
     if (autoTxNumForDraw) {
        txNumForDraw = (rand % 10) + 10;
                        }
     
    }
