require 'rails_helper'

describe 'User Attend Event', type: :request do
  fixtures :users
  fixtures :events

  it 'return a 200 status code after accepting the invitation to an event' do
    yair = users(:yair)
    attendee = users(:jaak)
    # log_in attendee
    post login_path, params: { session: { email: attendee.email } }
    
    # p current_user.id
    # p current_user.name
    # # assert logged_in?
    get new_event_path
    # post events_path, params: { event: {
    #       name: 'The best moment',
    #       location: "Wonderland", 
    #   description: "Spend wonderful time with Alice!",
    #           date: DateTime.now,
    #     creator_id: attendee.id 
    # }}
    # my_event = Event.last
    # get :invite, params: { id: event.id, user_id: attendee.id }
    # get invite_event_path, params: { id: my_event.id, user_id: yair.id }
    # get invite_event_path, params: { id: my_event.id, user_id: yair.id }
    # log_out
    # follow_redirect!
    # expect(logged_in?).to be(false)
    # expect(current_user).to be(nil)
    # log_in yair
    
    # p session[:user_id]
    # p current_user.id
    # p current_user.name
    # @current_user.reload
    # assert logged_in?
    
    # expect(@current_user.name).to eq(yair.name)
    # expect(@current_user.id).to eq(yair.id)
    # get :attend, params: { id: my_event.id}
    # expect(response.status).to be(200)
    # expect(flash[:success]).to be_present
    # expect(response).to redirect_to invited_events_path

  end
end
