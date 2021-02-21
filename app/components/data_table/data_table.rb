# frozen_string_literal: true

module DataTable
  class DataTable < ViewComponent::Base
    include Pagy::Frontend
    def initialize(model_name: '', column_model: [], show_path: nil, edit_path: nil, delete_path: nil, data: [], pagy: nil)
      @model_name = model_name
      @column_model = column_model
      @data = data
      @pagy = pagy
      @show_path = show_path
      @edit_path = edit_path
      @delete_path = delete_path
    end

    def show_path(row)
      @show_path.nil? ? "#{model_base_url}/#{row.id}" : @show_path
    end

    def edit_path(row)
      @edit_path.nil? ? "#{model_base_url}/#{row.id}/edit" : @edit_path
    end

    def delete_path(row)
      @delete_path.nil? ? "#{model_base_url}/#{row.id}" : @delete_path
    end

    private

    def model_base_url
      model_name.pluralize
    end

    attr_reader :model_name, :column_model, :data, :pagy
  end
end
