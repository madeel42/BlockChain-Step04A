//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./SecondContract.sol";

contract CallFunctionDemo {
    uint256 public val = 5;
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function callerFunTest() public {
        // this is what if we have code available
        // secondContract abc = new secondContract();
        // abc.doSomeThing();
        ////
        //  if we don't have code available then we need address
        // you can write call or delegatecall but there is difference between them
        //dfifference between delegatecall and call:
        // ---delegatecall
        // when we do delegatecall it will actually become part of CallFunctionDemo contract and only -->
        //update state of CallFunctionDemo and will not update state-->
        //of SecondContract contract because on calling delegate call it become the part of CallFunctionDemo contract;
        //delegatecall is calling the function as it is part of the current contract . (from contract it is calling)
        // ---call
        //when we do call it will update state of SecondContract;
        //call is calling as an external function

        //  (bool success, bytes memory data) = contractAddress.call{value:address(this).balance}(
        //             abi.encodeWithSignature("doSomeThing(uint256)", 23)
        //         );  thats how you call the gass or transfer ether as well

        (bool success, bytes memory data) = contractAddress.call(
            abi.encodeWithSignature("doSomeThing(uint256)", 23)
        );
        // (bool success, bytes memory data) = contractAddress.delegatecall(
        //     abi.encodeWithSignature("doSomeThing(uint256)",23)
        // );
        console.log("CallFunctionDemo::callerFunTest success = ", success);
    }

    function callerFunTestDelegate() public {
        (bool success, bytes memory data) = contractAddress.delegatecall(
            abi.encodeWithSignature("doSomeThing(uint256)", 23)
        );
        console.log(
            "CallFunctionDemo::callerFunTestDelegate success = ",
            success
        );
    }

    // ---staticcall
    //staticcall should not change state of contract or should not change anything;
    //one more thing here is that as well what ever functionality is doSomeThing will working fine but it should not change state of contract or should not change anything;
    //staticcall will be call independent contract because there is no change of state

    function callerFunTestStatic() public view {
        (bool success, bytes memory data) = contractAddress.staticcall(
            abi.encodeWithSignature("doSomeThing(uint256)", 23)
        );
        console.log(
            "CallFunctionDemo::callerFunTestStatic success = ",
            success
        );
    }
}
