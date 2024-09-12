class Role < ApplicationRecord
  enum name: %i[user admin]
end
