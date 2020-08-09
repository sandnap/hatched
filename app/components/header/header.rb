# frozen_string_literal: true

module Header
  class Header < ViewComponent::Base
    def initialize(tabs: [], button_title: nil)
      @tabs = tabs
      @button_title = button_title
    end

    private

    attr_reader :tabs

    def tab_class(index)
      "block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white#{' mr-4' if index < @tabs.length - 1}"
    end
  end
end
