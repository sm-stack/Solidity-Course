// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Deploy1{

    error NoDeployFromCA();
    // Optimisation for initCode, saves about 300 gas
    constructor() payable {
        address _addr = msg.sender;
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        if (size > 0) revert NoDeployFromCA();
    }
    
    // JUMPDEST PUSH1 07 PUSH1 08 ADD PUSH1 40 MLOAD DUP2 MSTORE POP JUMP
    function addInYul() external pure {
        assembly {
            let x := add(0x07, 0x08)
            mstore(mload(0x40), x)
        }
    }
}

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            let x := mol
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            mstore(mload(0x40), x)
            // to return you need to specify address and the size from the starting point
            return (mload(0x40), 0x20)
        }
    }
}

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        // and return the result from the second block
        assembly {
            let result := add(x, y)
            mstore(mload(0x40), result)
        }

        assembly {
            return(mload(0x40), 0x20)
        }
    }
}

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            switch lt(x,y) 
            case 0 {
                mstore(mload(0x40), sub(x,y))
                return(mload(0x40), 0x20)
            }
            default {
                return(mload(0x40), 0x20)
            }
        }
    }
}

contract Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        // Modify state of the count variable from within
        // the assembly segment
        assembly {
            sstore(0, add(sload(0), num))
        }
    }
}
