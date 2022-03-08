const host = "http://127.0.0.1:7545";
const Web3 = require("web3");
const HelloWorldContract = require("./build/contracts/HelloWorld.json");

const getValueAtAddress = async (host, contractabi, address) => {
  const web3 = new Web3(host);
  const contract = new web3.eth.Contract(contractabi, address);
  const res = await contract.methods.message().call();
  //   console.log(JSON.stringify(res));
  console.log("Greeting from contract is : " + res);
  console.log("Greeting Address is : " + address);
  return res;
};

getValueAtAddress(
  host,
  HelloWorldContract.abi,
  HelloWorldContract.networks[5777].address
);
