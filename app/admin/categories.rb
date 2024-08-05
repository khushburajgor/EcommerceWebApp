ActiveAdmin.register Category do
  permit_params :name, :parent_id

  form do |f|
    f.inputs 'Category Details' do
      f.input :name
      f.input :parent, as: :select, collection: Category.all
    end
    f.actions
  end
end
