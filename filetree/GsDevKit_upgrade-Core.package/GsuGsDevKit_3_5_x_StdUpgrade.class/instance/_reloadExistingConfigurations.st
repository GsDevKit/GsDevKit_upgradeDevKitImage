private
_reloadExistingConfigurations
	"before #loadApplicationLoadSpecs, we removed configurations from the image, and there could be methods that still reference, 
		so reload the default copies of configurations. The configurations are expected to be present in
		http://seaside.gemtalksystems.com/ss/MetacelloRepository"

	self bootstrapApplicationLoadSpecs isEmpty 
		ifTrue: [
			"no need to reload _defaultExistingConfigurationOfNames ... GLASS was reloaded"
			^ self ].
	self _defaultExistingConfigurationOfNames do: [:configName |
		self log: '		reloading existing configuration: ', configName asString.
		(self _globalNamed: 'Gofer') new 
			url: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository';
			package: configName asString;
			load ].