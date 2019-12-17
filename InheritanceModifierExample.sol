pragma solidity ^0.5.11;

import "./owned.sol";

contract InheritanceModifierExample is owned{
    mapping(address => uint) public tokenBalance;
    uint tokenPrice = 1 ether;
    constructor() public{
        tokenBalance[owner] = 100;
    }
    function createNewToken() public onlyOwner{
        tokenBalance[owner]++;
    }
    function burnToken() public onlyOwner{
        tokenBalance[owner]--;
    }
    function purchaseToken() public payable{
        require((tokenBalance[owner] * tokenPrice) / msg.value>0,"Not enough tokens");
        tokenBalance[owner] -= msg.value/tokenPrice;
        tokenBalance[msg.sender] += msg.value/tokenPrice;
    }
    function sendToken(address _to, uint _tokenCount) public{
        require(tokenBalance[msg.sender]>_tokenCount, "Not enough balance");
        assert(tokenBalance[_to] + _tokenCount > tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _tokenCount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _tokenCount;
        tokenBalance[_to] += _tokenCount;
    }
}