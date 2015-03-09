class AccessController < ApplicationController
  def create
    raise env["omiauth.auth"].to_yml
  end
end 