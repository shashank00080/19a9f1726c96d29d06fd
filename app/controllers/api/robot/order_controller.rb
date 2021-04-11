class Api::Robot::OrderController < ActionController
	before_action :check_robot  #check record present or not 

	def create  
		robot_position = RobotMovement.new(check_robot,robots_commands).robot_movement
		render  json: { location: robot_position }
	end
	def robots_commands
		@commands ||= params[:commands]
	end
	
	def check_robot
		@robot ||= Robot.where(id: params[:id]).find_or_create
	end
end