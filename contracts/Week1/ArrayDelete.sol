// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

contract ArrayDelete {

    function deleteIndexMemory(uint256[] calldata arr, uint256 index) external pure returns (uint256[] memory) {
        require(index < arr.length, "Index Out of Range");
        uint256[] memory new_arr = new uint256[](arr.length - 1);
    
        for (uint256 i ; i < index;) {
            new_arr[i] = arr[i];
            unchecked {
                ++i;
            }
        }

        for (uint256 i = index; i < arr.length - 1;) {
            new_arr[i] = arr[i+1];
            unchecked {
                ++i;
            }
        }
        return new_arr;
    } 
}