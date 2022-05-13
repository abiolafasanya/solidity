// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Library {
   
   struct Files {
       string filename;
       string cids;
       Privacy privacy;
       uint uploadedAt;
   }

   enum Privacy {
       publicFile,
       privateFile
   }

   mapping(address => Files[]) uploaderFiles;

   address[] uploader;

   mapping(address => bool) isUploader;

   mapping(Privacy => Files[]) uploadedFiles;

   mapping(address => mapping(Privacy => Files[])) myFiles;

   address owner;

   constructor(){
       owner = msg.sender;
   }

   modifier notEmpty(string memory _filename, string memory _cid) {
       bytes memory fileName = bytes(_filename); 
       bytes memory cidLink = bytes(_cid); 
       require(fileName.length > 0, "filename required");
       require(cidLink.length > 0, "cid link required");
       _;
   }

    modifier isOwner() {
        require(owner == msg.sender, "Only owner can call the function");
        _;
    }

   function upload(string memory _filename, string memory _cid, uint _privacy) public notEmpty(_filename, _cid) {
       isUploader[msg.sender] = true;
       Files memory fileToUpload = Files({
           filename: _filename,
           cids: _cid,
           privacy: Privacy(_privacy),
           uploadedAt: block.timestamp
       });
       myFiles[msg.sender][Privacy(_privacy)].push(fileToUpload);
       uploadedFiles[Privacy(_privacy)].push(fileToUpload);


   }

   function getMyPublicFiles() public view returns(Files[] memory){
       return myFiles[msg.sender][Privacy(0)];
   }

    function getMyPrivateFiles() public view returns(Files[] memory){
       return myFiles[msg.sender][Privacy(1)];
   }

    function getAllPublicFiles() public view returns(Files[] memory){
        return uploadedFiles[Privacy.publicFile];
    }

    function getAllPrivateFiles() public view isOwner returns(Files[] memory){
        return uploadedFiles[Privacy.privateFile];
    }
}
