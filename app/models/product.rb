class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "products"

  belongs_to :category
  has_many_attached :images

  validates :title, :description, :category, presence: true

  settings do
    mappings dynamic: false do
      indexes :title, type: :text
      indexes :description, type: :text
      indexes :variants, type: :object
      indexes :category_id, type: :integer
    end
  end

  def as_indexed_json(options = {})
    self.as_json(
      include: {
        category: { only: :name }
      },
      except: [:images]
    ).merge({
      variants: variants
    })
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "title", "updated_at", "variants"]
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'description']
          }
        }
      }
    )
  end

  after_save :update_elasticsearch_index
  after_destroy :delete_elasticsearch_index

  private

  def update_elasticsearch_index
    __elasticsearch__.index_document
  end

  def delete_elasticsearch_index
    __elasticsearch__.delete_document
  end
end
