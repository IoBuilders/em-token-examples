pragma solidity ^0.5.0;

import "emoney-token/contracts/EmoneyToken.sol";


contract TransferTokens {
    EmoneyToken internal emoney;

    constructor(EmoneyToken _emoney) public {
        require(address(_emoney) != address(0), "Emoney Token address can not be zero address");

        emoney = _emoney;
    }

    // transfer tokens on behalf of the sender of the transaction
    function doTransfer(string calldata _operationId, address _to, uint256 _value) external {
        emoney.operatorSend(
            _operationId,
            msg.sender,
            _to,
            _value
        );
    }

    function getEmoneyAddress() external view returns (address) {
        return address(emoney);
    }
}
