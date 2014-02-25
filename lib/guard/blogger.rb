require 'guard'
require 'guard/plugin'
require 'capybara'
require 'blogger/helpers'

module Guard
  class Blogger < Plugin
    include Capybara::DSL
    include ::Blogger::Helpers

    attr_reader :email, :password, :blog

    def initialize(options = {})
      super

      Capybara.default_driver = :selenium
      Capybara.app_host       = "https://www.blogger.com"

      @email    = options[:email]
      @password = options[:password]
      @blog     = options[:blog]
    end

    def start
      sign_in
    end

    def run_on_changes(paths)
      update_template(paths.first)
    end

  private

    def sign_in
      visit    '/'
      resize
      fill_in  'Email', with: email
      fill_in  'Password', with: password
      click_on 'Sign in'
      click_on blog
      click_on 'Template'
      click_on 'Edit HTML'
    end

    def update_template(path)
      UI.info "Updating Blogger template..."
      page.execute_script "document.getElementsByClassName('CodeMirror')[0].CodeMirror.doc.setValue('#{template(path)}')"
      click_on 'Save template'
      if page.has_selector? '.GFPUSQ2NMB'
        throw :task_has_failed
        UI.error 'Could not update Blogger template'
      end
    end

    def template(path)
      t = File.read(path)
      escape_template(t.nil? || t.empty? ? default_template : t)
    end

    def resize
      width  = page.execute_script('return window.screen.width')
      height = page.execute_script('return window.screen.height')
      page.driver.browser.manage.window.resize_to width, height
    end

  end
end