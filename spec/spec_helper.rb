$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'blankety_blank'
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :companies do |t|
    t.string :type
    t.string :name
    t.string :description
    t.string :phone
  end
end

class Company < ActiveRecord::Base
  include BlanketyBlank
  nilify_before_validation :name, :phone
end

class Vendor < Company; end
