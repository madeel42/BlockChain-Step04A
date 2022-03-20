//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SecondContract {
    uint256 public val = 5; // we will keep this variable in CallFunctionDemo as well

    function doSomeThing(uint256 _value) public {
        console.log("secondContract::doSomeThing= msg.sender=",msg.sender);
        console.log("secondContract::doSomeThing= tx.origin=",tx.origin);
        console.log("secondContract::doSomeThing=address(this)=",address(this));
        console.log("secondContract::doSomeThing= _value",_value);
        val = _value;
    }
}
