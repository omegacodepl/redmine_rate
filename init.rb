require 'redmine_rate'

if Rails::VERSION::MAJOR >= 5
  version = "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}".to_f
  PLUGIN_MIGRATION_CLASS = ActiveRecord::Migration[version]
else
  PLUGIN_MIGRATION_CLASS = ActiveRecord::Migration
end

Redmine::Plugin.register :redmine_rate do
  name 'Redmine Rate'
  author "Ralph Gutkowski"
  url 'https://github.com/rgtk/redmine_rate'
  author_url 'https://github.com/rgtk'
  description "Keep track not only on time but also money."
  version '1.0.1'

  requires_redmine version_or_higher: '2.3.0'

  settings default: {
    'supervisor_group_id' => '',
  }, partial: 'settings/redmine_rate'

  project_module :rate do
    permission :view_rates, {}, require: :member
    permission :edit_rates, {}, require: :member
  end

  menu :admin_menu, :rates, { :controller => 'rates', :action => 'index' },
       :caption => :label_rates, :after => :users, :html => {:class => 'icon icon-fav'}
end

RedmineRate.install
