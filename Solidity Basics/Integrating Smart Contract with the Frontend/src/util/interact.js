const alchemyKey ="wss://eth-sepolia.g.alchemy.com/v2/6TupF1LgmpnR6fx2mkPD4tGxE6ALBUMU"
const {createAlchemyWeb3} = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(alchemyKey);

const contractABI = require("../contract-abi.json")
const contractAddress = "0x112b9ea57EeF71dBB7F70Fe82D9D34d73da3EAcA";

export const helloWorldContract = new web3.eth.Contract(
    contractABI,
    contractAddress
);

export const loadCurrentMessage = async () => { 
  const message = await helloWorldContract.methods.message().call();
  return message;
};

export const connectWallet = async () => {
    if (window.ethereum) {
      try {
        const addressArray = await window.ethereum.request({
          method: "eth_requestAccounts",
        });
        const obj = {
          status: "👆🏽 Write a message in the text-field above.",
          address: addressArray[0],
        };
        return obj;
      } catch (err) {
        return {
          address: "",
          status: "😞" + err.message, // Added sad face
        };
      }
    } else {
      return {
        address: "",
        status: (
          <span>
            <p>
              {" "}
              🦊{" "} {/* Added fox */}
              <a target="_blank" href={`https://metamask.io/download`}>
                You must install Metamask, a virtual Ethereum wallet, in your
                browser.
              </a>
            </p>
          </span>
        ),
      };
    }
  
  };
  
  export const getCurrentWalletConnected = async () => {
    if (window.ethereum) {
      try {
        const addressArray = await window.ethereum.request({ 
          method: "eth_accounts"
        });
        if (addressArray.length > 0) {
          return {
            address: addressArray[0],
            status: "👆 Write a message in the text-field above."
          };
        } else {
          return {
            address: "",
            status: "🦊 Connect to Metamask using the top right button."
          };
        }
      } catch (err) {
        return {
          address: "",
          status: "😢 " + err.message // Added sad crying emoji
        };
      }
    } else {
      return {
        address: "",
        status: (
          <span>
            <p>
              {" "}
              🦊{" "} {/* Added fox emoji */}
              <a target="_blank" href="https://metamask.io/download">You must install Metamask, a virtual Ethereum wallet, in your browser.</a>
            </p>
          </span>
        )
      };
    }
  };
  
  
  
  export const UpdatedMessages = async (address, message) => {
    if (!window.ethereum || address === null) {
      return {
        status: "Connect your Metamask wallet to update the message on the Blockchain.",
      };
    }
    
    if (message.trim() === "") {
      return {
        status: "❌ Your message cannot be an empty string!",
      };
    }
    
    // Set up transaction parameters
    const transactionParameters = {
      to: contractAddress,
      from: address,
      data: helloWorldContract.methods.update(message).encodeABI(),
    };
  
    // Sign the transaction
    try {
      const txHash = await window.ethereum.request({
        method: "eth_sendTransaction",
        params: [transactionParameters],
      });
      return {
        status: (
          <span>
            ✅ {""}
            <a target="_blank" href={`https://sepolia.etherscan.io/tx/${txHash}`}>View the status of your transaction on Etherscan!</a>
            <br />
            ℹ️ Once the transaction is verified by the network, the message will be updated automatically.
          </span>
        ),
      };
    } catch (error) {
      return {
        status: "😢 " + error.message,
      };
    }
  };
