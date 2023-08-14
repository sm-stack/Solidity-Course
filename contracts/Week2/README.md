## Week 2
1. [TestYul.sol](./TestYul.sol)
- Includes 5 Contracts, the first one from [this gist](https://gist.github.com/extropyCoder/4243c0f90e6a6e97006a31f5b9265b94), and else from [Extropy github](https://github.com/ExtropyIO/ExpertSolidityBootcamp/tree/main/exercises/assembly). 
- Key Takeaways
    - A function including constructor can be optimised by setting it `payable`, unless `payable` do not make any vulnerabilities in the contract.
    - `extcodesize` can be used as a contract checker, but has a significant vulnerability. It can be bypassed when it's called inside the constructor of external contract. 
    - `mload(0x40)` is a good method to keep track of free memory.
    

2. [HW6.sol](./HW6.sol)
- Contract which returns call value in Wei, partially written in Yul.
- Part of [ERC20 contract written in Yul](https://docs.soliditylang.org/en/v0.8.19/yul.html)
    ```solidity
    function allowanceStorageOffset(account, spender) -> offset {
        offset := accountToStorageOffset(account)
        mstore(0, offset)
        mstore(0x20, spender)
        offset := keccak256(0, 0x40)
    }
    ```
    1. Get the storage offset of given account.
    2. Store it at memory position 0x00.
    3. Store spender address at memory position 0x20.
    4. Set offset info as a hash value of (account offset, spender address).
    This is to avoid hash collision when bringing allowance info.

3. [HW7.sol](./HW7.sol)
- Contract that has two functions. 
- One is to transfer ERC20 tokens, and the other is to check ERC20 transfer and emit an event.


