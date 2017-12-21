module Api
  module V1
    class CategoriesController < Api::V1::V1Controller
      defaults resource_class: Category

      private

      def category_params
        params.require(:category).permit(:name, :vertical_id, :state)
      end
    end
  end
end
