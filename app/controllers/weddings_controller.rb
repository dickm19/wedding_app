class WeddingsController < ApplicationController
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def show
        @wedding = Wedding.find(params[:id])
        if @wedding
            render json: @wedding, serializer: WeddingSerializer
        else
            render json: {
                status: 500,
                errors: [ "wedding not found" ]
            }
        end
    end

    def create
        @wedding = Weddding.new(wedding_params)
        if @wedding.save
            login!
            render json: @wedding, serializer: UserSerializer
        else
            render json: {
                status: 500,
                errors: @wedding.errors.full_messages
            }
        end
    end

    def update
        @wedding = Wedding.find(params[:id])
        @wedding.update(wedding_params)
        if @wedding.save
            render json: @wedding, serializer: WeddingSerializer
        else
            render json: {
                status: 403,
                errors: [ "not authorized to update this user" ]
            }
        end
    end

    def invite_guests
        @wedding = Wedding.find(params[:id])
        if @wedding
            @guest_emails = wedding_params[:guest_emails]
            @user = current_user
            @wedding.update(guest_emails: @guest_emails)
            UserMailer.with(user: @user, wedding: @wedding, recipient_emails: @guest_emails).guest_invite.deliver
            render json: @wedding, serializer: WeddingSerializer
        else
            render json: {
                status: 404,
                errors: [ "wedding not found" ]
            }
        end
    end

    private

    def wedding_params
        params.require(:wedding).permit({ guest_emails: [] }, :couple_names, :date)
    end
end
