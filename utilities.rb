module Utilities
	
	def leap_year? year
		fourHundredYear?(year) || (!hundredYear?(year) && fourYear?(year))
	end	

	SECONDS_IN_YEAR = 60*60*20*365.0

	def seconds_in_year(a)
		('%.1f' % ((a / SECONDS_IN_YEAR) * 100)) + '%'
	end



	def convert(x)
		a, b = x.split(":")
		#.split = split the a, b string that has : into two seperate stings.
		c, d = b.split(" ")
		#.split = split the c, d string that has a space into two different strings 
		e = ""

		if d.downcase != 'am'
			if a.to_i == 12
				e = a + ":" + c
			else
				e = (a.to_i + 12).to_s + ":" + c
			end
		elsif d.downcase != 'pm'
			if a.to_i == 12
				e = (a.to_i - 12).to_s + ":" + c
			else
				e = a + ":" + c
			end
		end

		return e
	end



	def convert2(x)
		a, b = x.split(":")
		c = ""

		if a.to_i < 12
			c = a + b + " am"
		else
			c = a + b + " pm"
		end

		return c
	end



	def okay(a, b)
		c = false
		if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
			c = false
		else
			c = true
		end
		return c
	end



	def span(a, b)
		c = 0
		d = 0
		if a < b
			c = b
			d = a
		else
			c = a
			d = b
		end

		return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
	end


	m = Class.new do
  		include Utilities
	end.new

	puts  m.okay "6:00", true

	private
		def hundredYear? year
			year % 100 == 0
		end
		def fourHundredYear? year
			year % 400 == 0
		end
		def fourYear? year
			year % 4 == 0 
		end


end