// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {

    // struct payments {
    //     bool valid;
    //     uint256 amount;
    //     address sender;
    //     uint8 paymentType;
    //     uint256 finalAmount;
    //     address receiver;
    //     uint256 initialAmount;
    //     bool checked;
    // }

    struct payments {
        uint256 amount;
        uint256 finalAmount;
        uint256 initialAmount;
        bool valid;
        uint8 paymentType;
        bool checked;
        address sender;
        address receiver;
    }
    uint8 index;
    bool flag1;
    address admin;
    mapping (address=>uint256) balances;
    bool flag2;
    bool flag3;
    address admin2;
    uint256 public number;
    payments[8] topPayments;


    constructor(){

    }


    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}