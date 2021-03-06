module Gaku
  class State < ActiveRecord::Base
    belongs_to :country, :foreign_key => 'country_numcode', :primary_key => 'numcode'

    validates_presence_of :country, :name

    attr_accessible :name, :name_ascii, :abbr, :code

    def self.find_all_by_name_or_abbr(name_or_abbr)
      where('name = ? OR abbr = ?', name_or_abbr, name_or_abbr)
    end

    # table of { country.id => [ state.id , state.name ] }, arrays sorted by name
    # blank is added elsewhere, if needed
    def self.states_group_by_country_numcode
      state_info = Hash.new { |h, k| h[k] = [] }
      State.order('name ASC').each { |state| state_info[state.country_numcode.to_s].push [state.id, state.name]}
      state_info
    end

    def <=>(other)
      name <=> other.name
    end

    def to_s
      name
    end

  end
end

