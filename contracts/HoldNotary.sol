pragma solidity ^0.5.0;

import "emoney-token/contracts/EmoneyToken.sol";


contract HoldNotary {
    EmoneyToken internal emoney;

    constructor(EmoneyToken _emoney) public {
        require(address(_emoney) != address(0), "Emoney Token address can not be zero address");

        emoney = _emoney;
    }

    // cancel the hold and do not transfer any tokens
    function releaseHold(string calldata _holdId) external {
        emoney.releaseHold(_holdId);
    }

    // execute the hold and transfer either the full, or a partial amount of tokens of the hold
    function executeHold(string calldata _holdId, uint256 _value) external {
        emoney.executeHold(_holdId, _value);
    }

    function getEmoneyAddress() external view returns (address) {
        return address(emoney);
    }
}
