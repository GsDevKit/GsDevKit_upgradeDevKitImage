prepare gsdevkit  image
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self timeStampedLog: 'Prepare gsdevkit - load GsDevKit application code'.	"now load application"

	self loadApplicationLoadSpecs.

	self _reloadExistingConfigurations.

	(self _globalNamed: 'TransactionBoundaryDefaultPolicy') isActive
		ifFalse: [ 
			"after application loaded, need to reenable SessionMethodTransactionBoundaryPolicy, since 
				TransactionBoundaryDefaultPolicy Current cvar cleared during upgrade"
			"https://github.com/GsDevKit/GsDevKit/issues/129"
			"internal bug 49225"
			(self _globalNamed: 'SessionMethodTransactionBoundaryPolicy') install.
			self
				timeStampedLog:
					'Prepare gsdevkit -  reenabled SessionMethodTransactionBoundaryPolicy' ].

	self log: '		load GsDevKit application code DONE (commit)'