## Week 3
1. [HW10.sol](./HW10.sol)
- First div function spends 130 gas, when second one spends 37 gas, checked on Remix.
- This indicates Solidity is not quite gas efficient. `div1` function contains 8 `JUMP` opcodes, while `div2` doesn't require any.

2. [DogCoinGame.sol](./DogCoinGame.sol) Audit
- Issues
    - `payWinners` function is vulnerable to DoS attack at `addWinner`. 
        - Access control is needed at `addWinner`.
    - FrontRunning at `payout` function will permanently make it useless.
        - If attacker front-runs `payout` function with a transaction sending some ether to the contract, the function gets useless.
    - No check at `payWinners::send`.
        - `send` will return boolean that indicates the success/failure of transferring ether, so we need to check it to ensure transfer worked well.
- Gas Optimization
    - Delete `addPlayer` function. It does nothing in the contract.
    - Cache winners.length in memory at `payWinners` function.
    