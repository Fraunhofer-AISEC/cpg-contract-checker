import {expect, use} from 'chai';
import {Contract, utils, Wallet} from 'ethers';
import {deployContract, deployMockContract, MockProvider, solidity} from 'ethereum-waffle';

import IERC20 from '../build/IERC20.json';
import AmIRichAlready from '../build/AmIRichAlready.json';
import SolveContract from '../build/SolveContract.json';
import RandomNumberConsumer from '../build/RandomNumberConsumer.json';

use(solidity);

describe('Am I Rich Already', () => {
    
    let mockERC20: Contract;
    let askRootContract: Contract;
    let solveRootContract: Contract;
    let vrfContract: Contract;
    
    
    let mockWallet: Wallet;
    let askRootWallet: Wallet;
    let solveRootWallet: Wallet;
    let vrfWallet: Wallet;

    beforeEach(async () => {
        
        
        
        
        
        
        const provider = new MockProvider(
            {
                ganacheOptions: {
                    
                    accounts: [
                        {balance: '16862680000000000001', secretKey: '0x706618637b8ca922f6290ce1ecd4c31247e9ab75cf0530a0ac95c0332173d7c1'}, 
                        {balance: '16862680000000000002', secretKey: '0x706618637b8ca922f6290ce1ecd4c31247e9ab75cf0530a0ac95c0332173d7c2'}, 
                        {balance: '16862680000000000003', secretKey: '0x706618637b8ca922f6290ce1ecd4c31247e9ab75cf0530a0ac95c0332173d7c3'},
                        {balance: '16862680000000000004', secretKey: '0x706618637b8ca922f6290ce1ecd4c31247e9ab75cf0530a0ac95c0332173d7c4'}
                    ]
                }
            }
        );
        
        [mockWallet, askRootWallet, solveRootWallet, vrfWallet] = provider.getWallets();
        mockERC20 = await deployMockContract(mockWallet, IERC20.abi);
        askRootContract = await deployContract(askRootWallet, AmIRichAlready, [mockERC20.address]);
        solveRootContract = await deployContract(solveRootWallet, SolveContract, [mockERC20.address]);
        vrfContract = await deployContract(vrfWallet, RandomNumberConsumer);
    });

    
    it('checks askRootContract address is returned correctly', async () => {
        expect(await askRootContract.getAddressThis()).to.be.equal('0x82A666453d8aa239eEBE4578E83cD0988D62c83F');
    });
    
    
    it('checks askRootWallet address balance is returned correctly', async () => {
        expect(await askRootContract.getAddressThisBalance()).to.be.equal(9001);
    }); 
});

