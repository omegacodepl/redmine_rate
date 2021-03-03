module RedmineRate
  module Patches
    module UsersHelperPatch
      def self.included(base)
        base.send(:include, InstanceMethods)

        base.class_eval do
          alias_method :user_settings_tabs_without_rate_tab, :user_settings_tabs
          alias_method :user_settings_tabs, :user_settings_tabs_with_rate_tab
        end
      end

      module InstanceMethods
        # Adds a rates tab to the user administration page
        def user_settings_tabs_with_rate_tab
          tabs = user_settings_tabs_without_rate_tab
          tabs << { :name => 'rates', :partial => 'users/rates', :label => :label_rates}
          return tabs
        end
      end
    end
  end
end
