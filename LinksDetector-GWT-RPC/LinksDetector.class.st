Class {
	#name : #LinksDetector,
	#superclass : #Object,
	#instVars : [
		'model',
		'links'
	],
	#category : #'LinksDetector-GWT-RPC'
}

{ #category : #accessing }
LinksDetector >> buildClientAssociations [

	|pattern dictionaries |
	
	pattern := LinksPatterns new 
					clientPattern .
	
	dictionaries := pattern collectBindings: { #ClientClass.} for: self model .
	
	dictionaries do: [ :eachDictionary |  
		"check for all available links if client class exists; if not add client with server nil"
		|clients|
		
		clients := self links select: [  :eachLink | 
			eachLink key name = (eachDictionary at: 'ClientClass') name.
		].
		
		clients ifEmpty: [ 
			self links add: ((eachDictionary at: 'ClientClass') -> nil ).
		].  
	].		
]

{ #category : #accessing }
LinksDetector >> buildClientServerAssociations [

	|pattern dictionaries |
	
	pattern := LinksPatterns new 
					clientServerPattern .
	
	dictionaries := pattern collectBindings: {  #ServerClass. #ClientClass.} for: self model .
	
	dictionaries do: [ :eachDictionary |  
		self links add: ((eachDictionary at: 'ClientClass') -> (eachDictionary at: 'ServerClass')).  			
	].
	
]

{ #category : #accessing }
LinksDetector >> buildServerAssociations [

	|pattern dictionaries |
	
	pattern := LinksPatterns new 
					serverPattern .
	
	dictionaries := pattern collectBindings: { #ServerClass.} for: self model .
	
	dictionaries do: [ :eachDictionary |  
		"check for all available links if client class exists; if not add client with server nil"
		|servers|
		
		
		servers := self links reject: [ :aLink | aLink value = nil ].

		servers := servers select: [ :eachLink |   
			eachLink value name = (eachDictionary at: 'ServerClass') name . 
		].
		
		servers ifEmpty: [ 
			self links add: ( nil -> (eachDictionary at: 'ServerClass') ).
		].  
	].	
	 		
]

{ #category : #'as yet unclassified' }
LinksDetector >> detectAllLinks [ 

	self buildClientServerAssociations.
	self buildClientAssociations.
	self buildServerAssociations. 
	
	
	
]

{ #category : #initialization }
LinksDetector >> initialize [ 

	super initialize.
	links := OrderedCollection new.
	
]

{ #category : #accessing }
LinksDetector >> links [

	^ links
]

{ #category : #accessing }
LinksDetector >> links: anObject [

	links := anObject
]

{ #category : #accessing }
LinksDetector >> model [

	^ model
]

{ #category : #accessing }
LinksDetector >> model: anObject [

	model := anObject
]
