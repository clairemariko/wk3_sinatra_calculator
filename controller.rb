require('sinatra')
require('sinatra/contrib/all')

require_relative('./models/calculator')

require('json')

#a root directory to combine all calculations through json
get '/all/:num1/:num2' do
  content_type(:json)

calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
result = {
add: calculator.add(),
subtract: calculator.subtract(),
divide: calculator.divide(),
multiply: calculator.multiply()

}

return result.to_json()
end


#an example of erb format

get '/add/:num1/:num2' do 

  calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
 @calculation = calculator.add()
 @name = "Claire"
 erb( :result )

end



get '/subtract/:num1/:num2' do 

    calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
    @calculation = calculator.subtract()
    erb(:result)
end



get '/mult/:num1/:num2' do 

      calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
      return "#{calculator.multiply()}"

end

get '/div/:num1/:num2' do 

        calculator = Calculator.new(params[:num1].to_i, params[:num2].to_i)
        return "#{calculator.divide()}"

end

get '/pokemon' do
  @pikachu = "pikachu"
  erb(:pokemon)
end

get '/info' do
  
  erb(:info)
end

