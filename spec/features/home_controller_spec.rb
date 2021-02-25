# frozen_string_literal: true

require 'rails_helper'

RSpec.feature '/' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let!(:blog1) { create(:blog, user: user1) }
  let!(:blog2) { create(:blog, user: user1) }
  let!(:blog3) { create(:blog, user: user2) }
  let!(:blog4) { create(:blog, user: user2) }

end
