module Api
  module V1
    class CoursesController < Api::V1::V1Controller
      defaults resource_class: Course

      private

      def course_params
        params.require(:course).permit(:name, :author, :category_id, :state)
      end
    end
  end
end
