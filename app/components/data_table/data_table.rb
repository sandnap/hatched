# frozen_string_literal: true

module DataTable
  class DataTable < ViewComponent::Base
    include Pagy::Frontend
    def initialize(model_name: '', column_model: [], data: [], pagy: nill)
      @model_name = model_name
      @column_model = column_model
      @data = data
      @pagy = pagy
    end

    private

    attr_reader :model_name, :column_model, :data, :pagy
  end
end
