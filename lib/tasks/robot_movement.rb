class RobotMovement
	def initialize(robot,commands)
		@robot = robot
		@commands = commands
		@position = []
		direction = ['NORTH','EAST','SOUTH','WEST']
	end

	def robot_movement
		@commands.each do |command|
			if command.include? 'PLACE'
				return unless @commands.first.include? 'PLACE'
				command = @commands.first.split(' ')[1].split(',')
				@robot.x_coordinate = command[0].to_i
				@robot.y_coordinate = command[1].to_i
				@robot.direction = command[2].to_s 
			elsif  command == 'LEFT'
				robot_position = direction.index @robot.direction
				@robot.direction = direction[robot_position - 1]
			elsif command == 'RIGHT'
				robot_position = direction.index @robot.direction
				robot_positon = robot_position == 3 ? -1 : robot_position
				@robot.direction = direction[robot_position + 1]
			elsif command == 'MOVE'
				move_robot
			elsif command == 'REPORT'
				@position << "#{@robot.x_coordinate},#{@robot.y_coordinate},#{@robot.direction}"
				@robot.save	
			end
		end
		@robot.save
		@position
	end


	def move_robot 
		case @robot.direction
		when 'NORTH'
			@robot.y_coordinate += 1 if  @robot.y_coordinate + 1 < 5
		when 'SOUTH'
			@robot.y_coordinate -= 1 if @robot.y_coordinate - 1 > 0
		when 'EAST'
			@robot.x_coordinate += 1 if@robot.y_coordinate + 1 < 5
		when 'WEST'
			@robot.x_coordinate -= 1 if @robot.x_coordinate - 1 > 0
		end
 
	end
end