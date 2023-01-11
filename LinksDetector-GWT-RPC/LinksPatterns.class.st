Class {
	#name : #LinksPatterns,
	#superclass : #Object,
	#category : #'LinksDetector-GWT-RPC'
}

{ #category : #'as yet unclassified' }
LinksPatterns >> clientPattern [

	^ FamixJavaModel % { 
	 #'allModelClasses>_' <=>  FamixJavaClass % { 
		#'isInterface' <=> true.
		#'superInheritances' <=> FamixJavaInheritance % {   
			#'superclass' <=> FamixJavaClass % { 
				#'name' <=> #'RemoteService'. 
			}.  
		} orMatches:  FamixJavaInheritance % { 
			#'superclass>superInheritances>superclass' <=> FamixJavaClass % { 
				#'name' <=> #'RemoteService'.
			}
		}.
		#'name' <=> #'@ClientClassName'
	} as: 'ClientClass'  .
}.
]

{ #category : #'as yet unclassified' }
LinksPatterns >> clientServerPattern [ 

	^ FamixJavaModel % { 
	#'allModelClasses>_' <=> FamixJavaClass % { 
		#'superInheritances' <=> FamixJavaInheritance % {   
			#'superclass' <=> FamixJavaClass % { 
				#'name' <=> #'RemoteService'. 
			}.  
		} orMatches:  FamixJavaInheritance % { 
			#'superclass>superInheritances>superclass' <=> FamixJavaClass % { 
				#'name' <=> #'RemoteService'.
			}
		}.
		#'subInheritances' <=> FamixJavaInheritance % { 
			#'subclass' <=> FamixJavaClass % { 
				#'superInheritances' <=> FamixJavaInheritance % {   
					#'superclass' <=> FamixJavaClass % { 
						#'name' <=> #'RemoteServiceServlet'. 
						#'isInterface' <=> false.
					}.  
				} orMatches:  
				FamixJavaInheritance % { 
					#'superclass>superInheritances>superclass' <=> FamixJavaClass % { 
						#'name' <=> #'RemoteServiceServlet'.
						#'isInterface' <=> false.
					}
				}. 
				"#'name' <=> #'@ServerClassName'	"
		 	} as: 'ServerClass'.				
		}. 			
		"#'name' <=> #'@ClientClassName'	"
	} as: 'ClientClass'.	
}.
]

{ #category : #'as yet unclassified' }
LinksPatterns >> serverPattern [

"to be fixed to do recursive search"

	^ FamixJavaModel % { 
	 #'allModelClasses>_' <=>  FamixJavaClass % { 
		#'isInterface' <=> false.
		#'superInheritances' <=> FamixJavaInheritance % {   
			#'superclass' <=> FamixJavaClass % { 
				#'name' <=> #'RemoteServiceServlet'. 
				#'isInterface' <=> false.
			}.  
		} orMatches:  FamixJavaInheritance % { 
			#'superclass>superInheritances>superclass' <=> FamixJavaClass % { 
				#'name' <=> #'RemoteServiceServlet'.
				#'isInterface' <=> false.
			}
		}.
		#'name' <=> #'@ServerClassName'
	} as: 'ServerClass'  
}
]
