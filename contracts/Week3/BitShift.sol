// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BitShift {

    // 0xBE86B90413BC283403C892D6BDB54F30233F23AB35439700123A1960CCF7664E
    uint256 public beValue = 86177475670493197073919501659849812897660611100807883281033508768520888346190;
    // 0xDE86B90413BC283403C892D6BDB54F30233F23AB35439700123A1960CCF7664E
    uint256 public deValue = 100651486825157721501865874785935801379319359184012953785965706769510029551182;

    // if the value x starts with 0xde, return x * 4
    // else if x starts with 0xbe, return x / 4 
    function shift_sol(bool beFlag) external {
        unchecked {
            uint256 value = beFlag? beValue : deValue;
            
                if (value >> 0xf8 == 0xbe) {
                    value = value * 4;
                } else if (value >> 0xf8 == 0xde) {
                    value = value / 4;
                } else {
                    value = 0;
                }
            
        
            beFlag? 
                beValue = value
                : deValue = value;
        }
    }


    function shift_yul(bool beFlag) external {
        unchecked { 
            assembly {
                let value
                switch beFlag
                case 0 {
                    value := sload(1)
                }
                case 1 {
                    value := sload(0)
                }

                switch shr(0xf8, value)
                case 0xbe {
                    value := mul(value, 0x04)
                }
                case 0xde {
                    value := div(value, 0x04)
                }
                default {
                    value := 0
                }

                switch beFlag
                case 0 {
                    sstore(1, value)
                }
                case 1 {
                    sstore(0, value)
                }
                
            }
        }
    }
}