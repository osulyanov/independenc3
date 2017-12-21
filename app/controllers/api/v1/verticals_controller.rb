module Api
  module V1
    class VerticalsController < Api::V1::V1Controller
      defaults resource_class: Vertical

      private

      def vertical_params
        params.require(:vertical).permit(:name)
      end
    end
  end
end
