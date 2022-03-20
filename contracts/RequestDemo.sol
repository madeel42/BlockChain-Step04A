//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./SecondContract.sol";

contract RequestDemo {
    function(uint256) external view returns (uint256) myCall;

    function receiveRequest(
        address _contractAddress,
        bytes4 callbackfunctionSignature
    ) public {
        console.log("RequestDemo::receiveRequest started=");
        (bool success, bytes memory data) = _contractAddress.call(
            abi.encodeWithSelector(callbackfunctionSignature, 45)
        );
        console.log("RequestDemo::receiveRequest after success=", success);
    }

    /// here using external function types
    function ReceiveFunctionRequest(
        function(uint256) external view returns (uint256) demoCall
    ) public {
        myCall = demoCall;
        uint256 valueAfter = demoCall(23);
        console.log("ReceiveFunctionRequest:: valueAfter", valueAfter);
    }

    function hello() public {
        uint256 valueAfter = myCall(12);
        console.log("ReceiveFunctionRequest:: valueAfter", valueAfter);
    }
}
