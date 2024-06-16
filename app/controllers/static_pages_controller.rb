class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[top term privacy]
  def top; end
end
