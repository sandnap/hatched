# frozen_string_literal: true

module Header
  class Header < ViewComponent::Base
    def initialize(tabs: [], button_title: nil, user_signed_in: false)
      super
      @tabs = tabs
      @button_title = button_title
      @user_signed_in = user_signed_in
    end

    private

    attr_reader :tabs, :user_signed_in

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
