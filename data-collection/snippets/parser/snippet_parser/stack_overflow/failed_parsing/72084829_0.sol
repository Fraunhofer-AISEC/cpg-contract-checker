 
     enter code here
    
        pragma solidity ^0.8.13;
        
        contract Token {
            
            string public name = "My Token";
        }
        

    
    enter code here
        const Token = artifacts.require('Token');
        require('chai')
        .use(require('chai-as-promised'))
        .should();
        
        contract('Token', (accounts)=>{
        
            describe('deployment', ()=>{
        
                it("should return token name", async()=>{
                    const token = Token.new();
                    const name = await token.name();
        
                    name.should.equal('My Token')
                } );
            })
        
        })
