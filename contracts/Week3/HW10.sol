// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;


contract Divdiv {

    // 130 gas
    function div1(uint numerator, uint denominator) public pure returns(uint256 result ) {
        result = numerator / denominator;
    }

    // 37 gas
    function div2(uint numerator, uint denominator) public pure returns(uint256 result ) {
        assembly {
            result := div(numerator, denominator)
        }
    }
}