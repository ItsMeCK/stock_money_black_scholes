class BlackSchole < ActiveRecord::Base
	validates :stock_price,  presence: true, numericality: {:greater_than => 0.00}
	validates :strike_price,   presence: true, numericality: {:greater_than => 0.00}
	validates :interest_rate,  presence: true,  numericality: {:greater_than => 0.00}
	validates :time,  presence: true,  numericality: {:greater_than => 0.00}
	validates :volatility,  presence: true,  numericality: {:greater_than => 0.00}

def self.cnd(x)
	a1, a2, a3, a4, a5 = 0.31938153, -0.356563782, 1.781477937, -1.821255978, 1.330274429
	l = x.abs
	k = 1.0 / (1.0 + 0.2316419 * l)
	w = 1.0 - 1.0 / Math.sqrt(2*Math::PI)*Math.exp(-l*l/2.0) * (a1*k + a2*k*k + a3*(k**3) + a4*(k**4) + a5*(k**5))
	w = 1.0 - w if x < 0
	return w
end

def self.black_scholes(callPutFlag, s, x, t, r, v)
	result = {}
	d1 = (Math.log(s/x)+(r+v*v/2.0)*t)/(v*Math.sqrt(t))
	result[:d1] = d1
	d2 = d1-v*Math.sqrt(t)
	result[:d2] = d2
	if callPutFlag == 'c'
		result[:c] = s*cnd(d1)-x*Math.exp(-r*t)*cnd(d2)	
	else
		result[:p] = x*Math.exp(-r*t)*cnd(-d2)-s*cnd(-d1)	 
	end
	return result
end

def self.get_c
	max = BlackSchole.maximum(:time).to_f
	res = []
	i = 0
	while i <= max 
		set = false
		BlackSchole.where("time >=  ? and time < ?", i-2, i).each do |b_s|
    	res << b_s.c.to_f
  		set = true
  	end
  	res << 0 unless set
  	i = i + 2
  end	
  res 
end

def self.get_p
	max = BlackSchole.maximum(:time).to_f
	res = []
	i = 0
	while i <= max 
		set = false
		BlackSchole.where("time >=  ? and time < ?", i-2, i).each do |b_s|
    	res << b_s.p.to_f
  		set = true
  	end
  	res << 0 unless set
  	i = i + 2
  end	
  res 
end

def self.get_d1
	max = BlackSchole.maximum(:time).to_f
	res = []
	i = 0
	while i <= max 
		set = false
		BlackSchole.where("time >=  ? and time < ?", i-2, i).each do |b_s|
    	res << b_s.d1.to_f
  		set = true
  	end
  	res << 0 unless set
  	i = i + 2
  end	
  res  
end

def self.get_d2
	max = BlackSchole.maximum(:time).to_f
	res = []
	i = 0
	while i <= max 
		set = false
		BlackSchole.where("time >=  ? and time < ?", i-2, i).each do |b_s|
    	res << b_s.d2.to_f
  		set = true
  	end
  	res << 0 unless set
  	i = i + 2
  end	
  res  
end	

end
