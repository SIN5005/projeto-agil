class ConfigureBDD
	attr_accessor :defaultUrl, :generatedEmail

	def getDefaultUrl
		@defaultUrl     = File.read("features/configuration/host")
	end

	def getGeneratedEmail
		@generatedEmail = File.read("features/configuration/email")
	end
end