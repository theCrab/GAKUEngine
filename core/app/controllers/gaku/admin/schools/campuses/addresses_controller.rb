module Gaku
  module Admin
    class Schools::Campuses::AddressesController < GakuController

      authorize_resource :class => false

    	inherit_resources
      respond_to :js, :html

    	before_filter :load_vars
      before_filter :before_index, :only => :index

      def create
        @address = @campus.build_address(params[:address])
        if @address.save
          respond_with @address
        end
      end

      def destroy
        @address = Address.find(params[:id])
        @campus.address.destroy
        respond_with(@campus.address)
      end

      private

      def before_index
        @address = @campus.address
      end

      def load_vars
        @school = School.find(params[:school_id])
        @campus = Campus.find(params[:campus_id])
      end

    end
  end
end
