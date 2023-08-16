// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {BitShift} from "../../contracts/Week3/BitShift.sol";


contract BitShiftTest is Test {
    BitShift public bitShift_sol;
    BitShift public bitShift_yul;

    function setUp() public {
        bitShift_sol = new BitShift();
        bitShift_yul = new BitShift();
    }

    function testShiftinSolidity() public {
        bitShift_sol.shift_sol(true);
        assertEq(bitShift_sol.beValue(), 113125724207340397448536036622023435884102475071950405045218867058257294104888);
        bitShift_sol.shift_sol(false);
        assertEq(bitShift_sol.deValue(), 25162871706289430375466468696483950344829839796003238446491426692377507387795);

    }

    function testShiftinYul() public {
        bitShift_yul.shift_yul(true);
        assertEq(bitShift_yul.beValue(), 113125724207340397448536036622023435884102475071950405045218867058257294104888);
        bitShift_yul.shift_yul(false);
        assertEq(bitShift_yul.deValue(), 25162871706289430375466468696483950344829839796003238446491426692377507387795);
    }
}
