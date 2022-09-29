module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end


end
