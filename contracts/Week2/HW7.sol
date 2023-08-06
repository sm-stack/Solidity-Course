// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Transfer {

    error TransferFailed();
    error NotERC20Transfer();

    event transferOccurred(address,uint256);
    
    bytes4 private constant SELECTOR = bytes4(keccak256(bytes('transfer(address,uint256)')));
    address token;
    
    constructor(address _token) {
        token = _token;
    }

    function query(uint _amount, address _receiver, bytes4 sig) public {
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(sig, _receiver,_amount));
        if (!(success && (data.length == 0 || abi.decode(data, (bool))))) revert TransferFailed();
    }

    function checkCall(bytes calldata data) external{
        (bytes4 selector, address to, uint256 amount) = abi.decode(data, (bytes4, address, uint256));
        if (selector != SELECTOR) revert NotERC20Transfer();
        query(amount, to, selector);
        emit transferOccurred(to, amount);
    }
}