private
_defaultBootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	self _todeLoaded
		ifTrue: [
			self log: '	load BaselineOfMetacello BaselineOfTode'.
			"first update Metacello and then update Tode"
			^{
				{
					'Metacello'. 
				}.
				{
					'Tode'. 
				}.
			} ].
	self _glass1Loaded
		ifTrue: [
			self log: '	load BaselineOfMetacello BaselineOfGLASS1'.
			"first update Metacello and then update GLASS1"
			^{
				{
					'Metacello'. 
				}.
				{
					'GLASS1'. 
				}.
			} ].
	self _gsDevKitLoaded
		ifTrue: [
			self log: '	load BaselineOfGsDevKit'.
			^{	"assume that GsDevKit needs to be reloaded"
				 {
						'GsDevKit'. 
				}.
			} ].
	self log: '	load ConfigurationOfGLASS'.
	^{	"assume that GLASS needs to be reloaded"
		 {
				'ConfigurationOfGLASS'. 
				'1.0-beta.9.2.2'. 
				#('default'). 
				nil.	"nill - use bootstrapRepositoryDirectory"
		}.
	}