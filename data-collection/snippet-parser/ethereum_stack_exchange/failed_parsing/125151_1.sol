const { contracts } = require('@openzeppelin/cli/lib/prompts/choices');
const { BN, ether, expectRevert } = require('@openzeppelin/test-helpers');
const { expect, assert } = require('chai');
const GuessAndWinContract = artifacts.require('GuessAndWin');
contract('GuessAndWin', function(accounts){
    const owner = accounts[0];
    const recipient = accounts[1];

    beforeEach(async function(){
        this.cInstance = await GuessAndWinContract.new('test test', 'test', {from:owner});
    });

    describe('#INITIALISATION', function(){
        it('verify if owner is msg.sender', async function(){
            const contractOwner = await this.cInstance.owner()
            expect(contractOwner).to.be.equal(owner);
        });
        it('should not accept to create a contract with hint == word', async function(){
            await expectRevert(this.cInstance.changeWord('test', 'test', {from:owner}), "word and hint have to be different");
        });
    });
    describe('#PROPOSE A WORD', function(){
        it('should return true when submiting the right word', async function(){
            const bool = await this.cInstance.proposeWord('test', {from:owner, value:(1*10**18)});
            expect(bool).to.be.ok;
        });
        it('should return false when submiting the right word', async function(){
            const bool = await this.cInstance.proposeWord('coucou', {from:owner, value:(1*10**18)});
            expect(bool).to.be.ok;
        });
        **it('should revert if user has already try', async function(){
            await this.cInstance.proposeWord('coucou', {from:owner, value:(1*10*18)});
            await expectRevert(this.cInstance.proposeWord('coucou', {from:owner, value:(1*10*18)}), "Sorry, you already got your chance");
        })**
    })
});
