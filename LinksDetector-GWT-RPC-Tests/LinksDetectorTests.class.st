Class {
	#name : #LinksDetectorTests,
	#superclass : #TestCase,
	#category : #'LinksDetector-GWT-RPC-Tests'
}

{ #category : #tests }
LinksDetectorTests >> testClientAssociations [

	| linksDetector |
	linksDetector := LinksDetector new.
	linksDetector model: (MooseModel root at: 1). "To be changed by filling a test model"
	linksDetector buildClientServerAssociations .
	linksDetector buildClientAssociations . 
	
	self assert: linksDetector links isNotEmpty. 
]

{ #category : #tests }
LinksDetectorTests >> testClientServerAssociations [

	| linksDetector |
	linksDetector := LinksDetector new.
	linksDetector model: (MooseModel root at: 1). "To be changed by filling a test model"
	linksDetector buildClientServerAssociations . 
	
	self assert: linksDetector links isNotEmpty. 
]

{ #category : #tests }
LinksDetectorTests >> testDetectAllLinks [

	| linksDetector |
	linksDetector := LinksDetector new.
	linksDetector model: (MooseModel root at: 1). "To be changed by filling a test model"
	linksDetector detectAllLinks . 
	
	self assert: linksDetector links isNotEmpty. 
]

{ #category : #tests }
LinksDetectorTests >> testFillModel [ 

	| linksDetector |
	linksDetector := LinksDetector new.
	linksDetector model: (MooseModel root at: 1). "To be changed by filling a test model"
	 
	self assert: linksDetector model isNotNil.
	self assert: linksDetector model allModelClasses isNotEmpty
]

{ #category : #tests }
LinksDetectorTests >> testInitialize [

	| linksDetector |
	linksDetector := LinksDetector new.
	
	self assert: linksDetector links isEmpty.
	self assert: linksDetector model isNil   
]

{ #category : #tests }
LinksDetectorTests >> testServerAssociations [

	| linksDetector |
	linksDetector := LinksDetector new.
	linksDetector model: (MooseModel root at: 1). "To be changed by filling a test model"
	linksDetector buildClientServerAssociations .
	linksDetector buildServerAssociations . 
	
	self assert: linksDetector links isNotEmpty. 
]
