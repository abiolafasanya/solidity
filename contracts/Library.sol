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

    Files[] public uploadedFiles;

    mapping(address => Files[]) uploaderFiles;

   address[] uploader;

   mapping(address => bool) isUploader;

   mapping(string => bool) fileExits;

   mapping(Privacy => Files) files;

   mapping(address => mapping(Privacy => Files)) myFiles;

   function upload(string memory _filename, string memory _cid, uint _privacy) public {
       require(fileExits[_filename] != true, "Filename already exists, rename");
       fileExits[_filename] = true;
       isUploader[msg.sender] = true;
       Files memory fileToUpload = Files({
           filename: _filename,
           cids: _cid,
           privacy: Privacy(_privacy),
           uploadedAt: block.timestamp
       });
       myFiles[msg.sender][Privacy(_privacy)] = fileToUpload;
       uploadedFiles.push(fileToUpload);


   }

   function getPublicFiles() public view returns(Files memory){
       return myFiles[msg.sender][Privacy(0)];
   }

    function getPrivateFiles() public view returns(Files memory){
       return myFiles[msg.sender][Privacy(1)];
   }

}
