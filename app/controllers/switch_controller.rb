class SwitchController < ApplicationController

	def disable
		@user = current_user
		@user.otp_required_for_login = false
		@user.otp_secret = ""
		@user.save!
		redirect_to root_path
	end

	def enable
		@user = current_user
		@user.otp_required_for_login = true
		@user.otp_secret = User.generate_otp_secret
		@user.save!
	end

end
