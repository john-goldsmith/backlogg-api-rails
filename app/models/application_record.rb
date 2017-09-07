class ApplicationRecord < ActiveRecord::Base

  include Docs::ApplicationRecord

  self.abstract_class = true

end
