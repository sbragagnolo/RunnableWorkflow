Class {
	#name : #BaselineOfRunnableWorkflow,
	#superclass : #Object,
	#category : #BaselineOfRunnableWorkflow
}

{ #category : #baselines }
BaselineOfRunnableWorkflow >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: #TaskIt with: [ spec repository: 'github://sbragagnolo/taskit:dev-1.1' ];
				baseline: #Workflow with: [ spec repository: 'github://smartshackle/Workflow/src' ].
			spec package: #RunnableWorkflow with: [ spec requires: #('TaskIt' 'Workflow') ] ]
]
