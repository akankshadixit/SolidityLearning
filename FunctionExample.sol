pragma solidity ^0.5.11;

contract FunctionExample{
    mapping(address => uint) public balanceReceived;
    address payable owner;
    constructor() public{
        owner = msg.sender;
    }
    function destroySmartContract() public{
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }
    function getOwner() public view returns(address){
        return owner;
    }
    function convertWeiToEther(uint _amountinWei) public pure returns(uint){
        return _amountinWei/1 ether;
    }
    function receiveMoney() public payable{
        assert (balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    function withdrawMoney(address payable _to, uint _amount) public{
        require(balanceReceived[msg.sender]>=_amount, "You do not have enough balance");
        assert(balanceReceived[msg.sender]>=balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    function () external payable{
        receiveMoney();
    }
}