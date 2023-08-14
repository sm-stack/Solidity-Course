# Solidity-Course
HW/TIL in Expert Solidity Bootcamp of Encode Club

---

## Week 1
1. [ArrayDelete.sol](./ArrayDelete.sol)

- Function `deleteIndexMemory` acts like `list.pop(index)` at Python, but instead of the deleted element it returns the array leftover after deletion of the element.
- It's a view function, and costs 27911 gas according to the gas simulation at ethers.js.

2. [StringCompare.sol](./CompareString.sol)

- Function `isEqual` is to compare two strings if they are equal to each other, inspired by this [Medium article](https://earlz.medium.com/the-faults-and-shortcomings-of-the-evm-bde4d09b8b6a).
- It's a variation of Openzeppelin [String.sol library](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/7222a31d548695998a475c9661fa159ef45a0e88/contracts/utils/Strings.sol#L90), but added some memory variables to inspect memory with foundry, which requires more gas.
- To debug it, Write `$ forge debug --debug contracts/Week1/CompareString.sol --sig "isEqual(string calldata,string calldata)" "hello2" "hello"` on the right path.
- The memory inspection at Foundry debugger is limited to 96 bytes (3rd memory space).
- The whole memory inspection can be performed through Remix debugger, and the result is like below:
```Javascript
{
    // Scratch Space
    "0x0": "0000000000000000000000000000000000000000000000000000000000000000",
    "0x20": "0000000000000000000000000000000000000000000000000000000000000000",
    // Free Memory Pointer
    "0x40": "0000000000000000000000000000000000000000000000000000000000000080",
    // Zero Slot
    "0x60": "0000000000000000000000000000000000000000000000000000000000000000",
    // 'hello2' and 'hello' is stored
    /*
    "0x80":
    0x68656c6c6f320000000000000000000000000000000000000000000000000000\thello2??????????????????????????
    */
    "0x80": "68656c6c6f000000000000000000000000000000000000000000000000000000\thello???????????????????????????",
    "0xa0": "0000000000000000000000000000000000000000000000000000000000000000\t????????????????????????????????"
}
``` 

3. [Store.sol](./Week1/Store.sol)

- Using [sol2uml](https://github.com/naddison36/sol2uml), we can visualize the storage of a contract. 
- [Store_previous.svg](./Week1/Store_previous.svg) describes the storage slot of previous Store.sol, which is commented out in the contract.
- [Store_now.svg](./Week1/Store_now.svg) describes the storage slot of current Store.sol, which saves 17 slots compared to the previous one.
- The order of state variabes are one of the important parts in gas optimization.
- You can test your own ordering of variables, by `sol2uml storage contracts/Week1/ -c Store`.

4. [Pond0x](./Week1/Pond0x.sol)

- Rug pull analysis on Pond0x / $PNDX
- Test codes in foundry is [here](../test/foundry-test/Pond0x.t.sol).
- Further info is on my [tweet](https://twitter.com/StackDigest/status/1685264826766131202?s=20).


