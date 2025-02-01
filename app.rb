require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  
  erb(:square)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @result = @num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  
  erb(:square_root)
end

get("/square_root/results") do
  @num = params.fetch("number").to_f
  @result = @num ** 0.5
  erb(:square_root_results)
end


get("/payment/new") do
 
  erb(:payment)
end

get("/payment/results") do
  apr = params.fetch("APR").to_f
  apr = (apr / 100)/12
  
  @months = (params.fetch("years").to_i)*12
  principal = params.fetch("principal").to_f

numerator = apr * principal
denominator = 1 - ((1 + apr) ** -@months)
@payment_result = (numerator / denominator).to_fs(:currency)


@apr = params.fetch("APR").to_i.to_fs(:percentage, {:precision => 4})
@principal = principal.to_fs(:currency)
@years = params.fetch("years")

  erb(:payment_results)
end

get("/random/new") do
 

  erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f

  @result = rand(@min..@max)

  erb(:random_results)
end
