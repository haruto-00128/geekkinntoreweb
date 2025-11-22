class Diagnosis < ApplicationRecord
  belongs_to :user
  attribute :result, :json, default: []
end
