require_relative '../spec_helper'

#be sure to add the other stuff to the Rake file

describe User do
  let(:user) {User.create(username: 'Drama', boardtype:'indo', password_digest:'123')}

  # before do
  #   user
  # end

  it 'should respond to /login' do
    get '/login'
    expect(last_response).to be_ok
    expect(last_response.body).to include 'Login'
  end



end
