// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CheckEther {
    function checkEther() external payable returns (uint256) {
        assembly {
            mstore(mload(0x40), callvalue())
            return(mload(0x40), 0x20)
        }
    }
}