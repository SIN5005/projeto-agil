class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true

	def check_status(status)
        if status
            [status, "Sucesso."]
        else
            [status, "Erro ao salvar."]
        end
	end
end
