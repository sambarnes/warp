import { ethers } from 'hardhat';
import { expect } from 'chai';

describe("ERC20 contract", function () {
    it("Deployment", async function () {
        // Deploy Solidity ERC20
        const NativeERC20 = await ethers.getContractFactory("ERC20");
        const nativeERC20 = await NativeERC20.deploy();
        await nativeERC20.deployed();
        console.log("Deployed");

        expect(await nativeERC20.totalSupply()).to.equal(100000000000000);
    });

});

// import { starknet } from "hardhat";

// describe("Cairo ERC20 contract", function () {
//     this.timeout(30_000); // 30 seconds - recommended if used with starknet-devnet
//     it("Deploy", async function () {
//         console.log("Entered!")
//         const contractFactory = await starknet.getContractFactory("ERC20");
//         const contract = await contractFactory.deploy();
//         console.log("Deployed at", contract.address);

//         // await contract.invoke("increase_balance", { amount: 10 }); // invoke method by name and pass arguments by name
//         // await contract.invoke("increase_balance", { amount: BigInt("20") });

//         // const { res } = await contract.call("get_balance"); // call method by name and receive the result by name
//         // expect(res).to.deep.equal(BigInt(40)); // you can also use 40n instead of BigInt(40)
//     });

    //   it("should work for a previously deployed contract", async function () {
    //     const contractFactory = await starknet.getContractFactory("MyContract");
    //     const contract = contractFactory.getContractAt("0x123..."); // you might wanna put an actual address here
    //     await contract.invoke(...);
    //   });

    //   /**
    //    * Assumes there is a file MyContract.cairo whose compilation artifacts have been generated.
    //    * The contract is assumed to have:
    //    * - view function sum_array(a_len: felt, a: felt*) -> (res: felt)
    //    */
    //   it("should work with arrays", async function() {
    //     const contractFactory = await starknet.getContractFactory("MyContract");
    //     const contract = await contractFactory.deploy(); // no constructor -> no constructor arguments
    //     const { res } = await contract.call("sum_array", { a: [1, 2, 3] });
    //     expect(res).to.deep.equal(BigInt(6));
    //   });

    //   /**
    //    * Assumes there is a file MyContract.cairo whose compilation artifacts have been generated.
    //    * The contract is assumed to have:
    //    * - view function sum_pair(pair: (felt, felt)) -> (res: felt)
    //    */
    //   it("should work with tuples", async function() {
    //     const contractFactory = await starknet.getContractFactory("MyContract");
    //     const contract = await contractFactory.deploy();
    //     // notice how the pair tuple is passed as javascript array
    //     const { res } = await contract.call("sum_pair", { pair: [10, 20] });
    //     expect(res).to.deep.equal(BigInt(30));
    //   });

    //   /**
    //    * Assumes there is a file MyAuthContract.cairo whose compilation artifacts have been generated.
    //    * The contract is assumed to have:
    //    * - constructor function constructor(lucky_user: felt, initial_balance: felt)
    //    * - external function increase_balance(user: felt, amount: felt) -> (res: felt)
    //    * - view function get_balance(user: felt) -> (res: felt)
    //    * 
    //    * increase_balance checks if the transaction invoking it was signed by the user whose public key is passed in
    //    */
    //   it("should work with signed transactions", async function() {
    //     const authContractFactory = await starknet.getContractFactory("MyAuthContract");
    //     const publicKey = BigInt("987...");
    //     const contract = await authContractFactory.deploy({ lucky_user: publicKey, initial_balance: 10 });

    //     // signature is calculated for each transaction according to `publicKey` used and `amount` passed
    //     const signature = [BigInt("123..."), BigInt("456...")];
    //     await contract.invoke("increase_balance", { user: publicKey, amount: 20 }, signature);

    //     // notice how `res` is mapped to `balance`
    //     const { res: balance } = await contract.call("get_balance", { user: publicKey });
    //     expect(balance).to.deep.equal(BigInt(30));
    //   });