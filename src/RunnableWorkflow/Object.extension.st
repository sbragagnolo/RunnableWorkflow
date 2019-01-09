Extension { #name : #Object }

{ #category : #'*RunnableWorkflow-Kernel' }
Object >> flwResolveSelector: aSelector [
	^ FLWPragmaBasedSelectorResolver new flwResolveSelector: aSelector on: self 
]
