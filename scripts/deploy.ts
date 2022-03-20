import { ethers } from "hardhat";
import { CallFunctionDemo, CallFunctionDemo__factory, SecondContract, SecondContract__factory } from "../typechain";

async function main() {

  const SecondContract: SecondContract__factory = await ethers.getContractFactory("SecondContract");
  const secondContract: SecondContract = await SecondContract.deploy();

  await secondContract.deployed();

  console.log("secondContract deployed to:", secondContract.address);


  const CallFunctionDemo: CallFunctionDemo__factory = await ethers.getContractFactory("CallFunctionDemo");
  const callFunctionDemo: CallFunctionDemo = await CallFunctionDemo.deploy(secondContract.address);

  await callFunctionDemo.deployed();

  console.log("CallFunctionDemo deployed to:", callFunctionDemo.address);
  console.log("CallFunctionDemo :", await callFunctionDemo.contractAddress());

  console.log('callFunctionDemo val before -->', await callFunctionDemo.val())
  console.log('secondContract val before -->', await secondContract.val())


  // const txt = await callFunctionDemo.callerFunTest()
  // const txt = await callFunctionDemo.callerFunTestDelegate()
  const txt = await callFunctionDemo.callerFunTestStatic()

  console.log('secondContract val after -->', await secondContract.val())
  console.log('callFunctionDemo val after -->', await callFunctionDemo.val())
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
