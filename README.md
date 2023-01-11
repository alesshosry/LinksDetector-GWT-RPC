# LinksDetector-GWT-RPC
This is a detector that uses MoTion to detect links, between both client and server sides, established using RPC in GWT framework

Usage:

1. Create a new Moose Image 
2. Import a Famix Model
3. Open Moose Playground (`Ctrl+OW`) in your and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```Smalltalk
Metacello new
    baseline: 'LinksDetectorGWTRPC';
    repository: 'github://AlessHosry/LinksDetector-GWT-RPC:main';
    load.
``` 
 
4. Paste below code in playground:

```Smalltalk
	linksDetector := LinksDetector new.
	linksDetector model: (MooseModel root at: 1).  "Make sure the index is correct"
   	linksDetector detectAllLinks . 
	rpclinks := linksDetector links
``` 

5. This library uses MoTion, in case it was not downloaded you can downloaded from here: https://github.com/alesshosry/MoTion 