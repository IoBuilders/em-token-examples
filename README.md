# Examples to interact with the E-money Token

This repository shows some examples, how other smart contracts can interact with the E-money Token on the [ioCash] platform.

## Installation
```
npm install
npx truffle compile
```

## Configuration
Only whitelisted accounts are able to operate with the [ioCash] platform. The private key of one of those accounts has to be configured in the file `truffle-config.js`:
```
const PRIVATE_KEY = '0xABCD....';
```

## Example 1: Transferring tokens by a smart contract

A smart contract should be able to transfer tokens on behalf of an account that is registered on [ioCash].

1. Start truffle console
   ```
   npx truffle console --network telsius
   ```
2. Get an instance of the E-Money Token with its current address:
    ```
    emoney = await EmoneyToken.at(ADDRESS_EM_TOKEN)
    ``` 
3. Deploy the demo smart contract with the current address of the E-money Token
    ```
    demoTransfer = await TransferTokens.new(emoney.address)
    ```
4. Authorize the deployed smart contract to do transfers on the registered accounts' behalf:
    ```
    emoney.authorizeTransferOperator(demoTransfer.address)
    ```
5. Call the demo smart contract to do a transfer on behalf of `msg.sender`:
    ```
    demoTransfer.doTransfer(TRANSFER_ID, TO_ADDRESS, AMOUNT_TO_TRANSFER)
    ```
   
## Example 2: A smart contract acts as a notary for holds

A smart contract should be able to be a notary for a hold that was created on [ioCash].

1. Start truffle console
   ```
   npx truffle console --network telsius
   ```
2. Get an instance of the E-Money Token with its current address:
    ```
    emoney = await EmoneyToken.at(ADDRESS_EM_TOKEN)
    ``` 
3. Deploy the demo smart contract with the current address of the E-money Token
    ```
    holdNotary = await HoldNotary.new(emoney.address)
    ```
4. Create a hold with an expiration time of 10 minutes and set the smart contract as notary:
    ```
    emoney.hold(UNIQUE_HOLD_ID, TO_ADDRESS, holdNotary.address, AMOUNT_OF_HOLD, 600)
    ```
5. One of the following two transactions can now be made:
 
    a. Call the demo smart contract to release the hold and do not do any transfer:
    ```
    holdNotary.releaseHold(UNIQUE_HOLD_ID)
    ```
   b. Call the demo smart contract to execute the hold and transfer the specified amount:
   ```
   holdNotary.executeHold(UNIQUE_HOLD_ID, AMOUNT_TO_TRANSFER)
   ```

[ioCash]: (https://io.cash/)
