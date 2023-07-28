// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

contract Test {
    function isEqual(string calldata a, string calldata b) public pure returns (bool) {
        uint len_a = bytes(a).length;
        uint len_b = bytes(b).length;
        bytes32 hash_a = keccak256(bytes(a));
        bytes32 hash_b = keccak256(bytes(b));
        return len_a == len_b && hash_a == hash_b;
    }
}