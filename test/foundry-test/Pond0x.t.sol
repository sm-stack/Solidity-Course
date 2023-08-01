// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {Pond0x} from "../../contracts/Week1/Pond0x.sol";
import {ModifiedPond0x} from "../../contracts/Week1/ModifiedPond0x.sol";
import {MockPerson} from "../../contracts/Week1/MockPerson.sol";

contract Pond0xTest is Test {
    Pond0x public pondToken;
    ModifiedPond0x public md_pondToken;

    MockPerson public person;

    function setUp() public {
        pondToken = new Pond0x();
        md_pondToken = new ModifiedPond0x();
        person = new MockPerson();

        pondToken.activate();
        pondToken.transfer(address(person), 10 ether);

        md_pondToken.activate();
        md_pondToken.transfer(address(person), 10 ether);
    }

    function testDirectTransferFromNotMyWallet() public {
        pondToken.directTransfer(address(person), address(this), 10 ether);
        assertEq(pondToken.balanceOf(address(person)), 0);
        assertEq(pondToken.balanceOf(address(this)), 2000000 ether);
    }

    function testModifiedDirectTransfer() public {
        vm.expectRevert(abi.encodeWithSelector(bytes4(0x13be252b)));
        md_pondToken.directTransfer(address(person), address(this), 10 ether);
    }
}
