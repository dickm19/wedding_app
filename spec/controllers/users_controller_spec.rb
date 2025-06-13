require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:user_params) do
        {
            email: "test@example.com",
            password: "password",
            first_name: "John",
            last_name: "Smith"
        }
    end

    let(:expected_response) do
        {
            "id" => @user.id,
            "email" => @user.email,
            "first_name" => @user.first_name,
            "last_name" => @user.last_name,
            "role" => @user.role,
            "avatar_url" => nil,
            "wedding_id" => @user.wedding_id
        }
    end

    before do
        @user = User.create(user_params)
    end

    describe 'GET #show' do
        subject(:show) { get :show, params: { id: @user.id } }

        before { show }

        it 'returns a success response' do
            expect(response).to be_successful
        end
        it 'returns the serialized user data' do
            expect(response.parsed_body).to include(expected_response)
        end
    end

    describe 'POST #create' do
        subject(:create) { post :create, params: { user: user_params.merge({ email: "test2@example.com"}) } }
        before { create }

        it 'returns a success response' do
            expect(response).to be_successful
        end

        it 'creates a new user' do
            expect(User.last.email).to eq("test2@example.com")
        end

        context 'when the user has a nearlywed role' do
            it 'creates a wedding for the user' do
                expect(User.last.wedding_id).not_to be_nil
            end
        end

        context 'when the user has a guest role' do
            subject(:create_guest) { post :create, params: { user: user_params.merge({ email: "guest@example.com", role: "guest", wedding_id: @user.wedding_id}) } }
            before { create_guest }

            it 'does not create a wedding for the user' do
                expect(User.last.wedding).to eq(@user.wedding)
            end

            it 'adds the user as a guest to the wedding' do
                expect(@user.wedding.guests).to include(User.last)
            end
        end
    end
end
