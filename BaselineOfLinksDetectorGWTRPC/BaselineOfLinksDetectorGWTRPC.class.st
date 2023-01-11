Class {
	#name : #BaselineOfLinksDetectorGWTRPC,
	#superclass : #BaselineOf,
	#category : #BaselineOfLinksDetectorGWTRPC
}

{ #category : #baselines }
BaselineOfLinksDetectorGWTRPC >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec baseline: 'MoTion' with: [ spec repository: 'github://AlessHosry/MoTion:main' ]. 	
		spec
			package: #'LinksDetector-GWT-RPC';
			package: #'LinksDetector-GWT-RPC-Tests' with: [ spec requires: #( 'LinksDetector-GWT-RPC' ) ].		
		spec group: 'default' with: #( 'LinksDetector-GWT-RPC' 'LinksDetector-GWT-RPC' ) ]
]
