pragma solidity ^0.5.11;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/ownership/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";


contract Allowance is Ownable{
     using SafeMath for uint;
     event AllowanceChanged(address indexed _forWho, address indexed _FromWhom, uint _oldAmount, uint _newAmount);
     mapping(address=>uint)public allowance;
     modifier ownerOrAllowed(uint _amount){
        require(isOwner()||allowance[msg.sender] >= _amount,"You are not allowed");
        _;
     }
    function addAllowance(address _who, uint _amount ) public onlyOwner{
       emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
       allowance[_who] = _amount;
    }
    function reduceAllowance(address _who, uint _amount) internal{
        emit AllowanceChanged(_who, msg.sender,allowance[_who], allowance[_who].sub(_amount));
       allowance[_who] = allowance[_who].sub(_amount);
    }
}