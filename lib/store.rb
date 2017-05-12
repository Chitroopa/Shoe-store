class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, :length => {:maximum => 100}})
  before_save(:capitalize_name)

  def self.duplicate_check(name)
    store_id = 0
    Store.all.each do |store|
      if store.name.gsub(/[^a-z," "]/i, '').downcase() == name.gsub(/[^a-z," "]/i, '').downcase()
        store_id = store.id
      end
    end
    store_id
  end

private

  def capitalize_name
    self.name=(name().capitalize())
  end

end
