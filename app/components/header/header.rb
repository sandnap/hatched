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
      "#{tab_common_classes(index)} text-teal-200 hover:text-white"
    end

    def disabled_tab_class(index)
      "#{tab_common_classes(index)} text-white font-semibold"
    end

    def tab_common_classes(index)
      "block mt-4 lg:inline-block lg:mt-0#{' mr-4' if index < @tabs.length - 1}"
    end
  end
end
