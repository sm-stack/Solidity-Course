// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ReturnETH {
    
    function callValue() external payable returns (uint256) {
        assembly {
            mstore(mload(0x40), callvalue())
            return(mload(0x40), 0x20)
        }
    }   
}

/*
0x 60 1e 80 60 09 3d 39 3d f3
-> PUSH1 0x1e(30 in uint) DUP1 PUSH1 0x09 RETURNDATASIZE CODECOPY 0x3d 0xf3  


*/
