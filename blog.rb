class Blog

	attr_accessor :post_list, :posts_per_page

	def initialize posts_per_page = 3
		@post_list = []
		@posts_per_page = posts_per_page
	end

	def add_post post
		@post_list << post
	end

	def compose_post post
		post_var = ""
		post_var += post.sponsored ? "******#{post.title}******".colorize(:red) : post.title
		post_var += "\n**************\n#{post.text}\n----------------\n"
	end

	def sort_all_posts
		@post_list.sort {|post1, post2| post2.date <=> post1.date}
	end

	def create_front_page front_page, page_num
		front_page_text =""
		offset = (page_num - 1) * @posts_per_page
		(offset..(offset+posts_per_page-1)).each do |post|
			#binding.pry
			front_page_text += compose_post(front_page[post]) unless post >= front_page.count
		end
		front_page_text
	end

	def print_pagination num_pages, current_page
		puts ""
		(1..num_pages).each do |p|
			if p == current_page
				print " #{p} ".colorize(:red)
			else
				print " #{p} "
			end
		end
		puts "\n"
	end

	def display_page(front_page, number_pages, page)
		front_page_text = create_front_page(front_page, page)
		puts front_page_text
		print_pagination(number_pages, page)
	end

	def publish_front_page
		front_page = sort_all_posts
		number_pages = (@post_list.count.to_f / @posts_per_page).ceil
		#binding.pry
		page = "1"
		until page == 'q'
			case page
			when "1"..number_pages.to_s
				display_page(front_page, number_pages, page.to_i)
			when 'q'
				puts "Good bye!"
			else
				puts "Incorrect number."
			end
			print "Type the page number you want to go to, q to quit: "
			page = gets.chomp
		end
	end

end


