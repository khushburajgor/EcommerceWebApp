ActiveAdmin.register Product do
  permit_params :title, :description, :category_id, images: [], variants: {}

  controller do
    after_action :debug_after_create, only: [:create]
    after_action :debug_after_update, only: [:update]

    def create
      super
    end

    def update
      super
    end

    private

    def debug_after_create
      # Parse and debug the variants parameter after creating
      if params.dig(:product, :variants).present?
        parsed_variants = parse_variants(params.dig(:product, :variants))
        @product = Product.last
        @product.update(variants: parsed_variants)
        Rails.logger.debug("Params after create: #{params.inspect}")
      end
    end

    def debug_after_update
      if params.dig(:product, :variants).present?
        parsed_variants = parse_variants(params.dig(:product, :variants))
        @product = Product.find(params[:id])
        @product.update(variants: parsed_variants)
      end
    end

    def parse_variants(variants_param)
      # Ensure the variants_param is a string before parsing
      if variants_param.is_a?(String)
        JSON.parse(variants_param)
      elsif variants_param.is_a?(Hash)
        variants_param
      else
        Rails.logger.error("Unexpected variants format: #{variants_param.inspect}")
        {}
      end
    rescue JSON::ParserError => e
      Rails.logger.error("JSON parsing error: #{e.message}")
      {}
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :category
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :variants, as: :text, input_html: { rows: 5 }, hint: 'Enter variants as JSON, e.g., {"colors": ["red", "blue"], "sizes": ["S", "M", "L"]}'
    end
    f.actions
  end

  index do
    selectable_column 
    id_column
    column :title
    column :description
    column :category
    column "Images" do |product|
      ul do
        if product.images.attached?
          product.images.each do |img|
            li do
              image_tag url_for(img), size: "50x50"
            end
          end
        else
          image_tag asset_path("image_1.jpg"), size: "50x50", alt: "No Photo"
        end
      end
    end
    column :variants do |product|
      product.variants.present? ? product.variants.to_json : "No Variants"
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :category
      row "Images" do |product|
        ul do
          if product.images.attached?
            product.images.each do |img|
              li do
                image_tag url_for(img), size: "50x50"
              end
            end
          else
            image_tag asset_path("image_1.jpg"), size: "100x100", alt: "No Photo"
          end
        end
      end
      row :variants do |product|
        product.variants.present? ? product.variants.to_json : "No Variants"
      end
    end
    active_admin_comments
  end

  filter :title
  filter :description
  filter :category
end
