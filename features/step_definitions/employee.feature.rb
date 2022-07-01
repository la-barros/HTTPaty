Dado('que o usuario consulte informações de fucncionario') do
    @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
 end
   
 Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
 end
   
 Então('uma lista de funcionarios deve retornar') do
     expect(@list_employee.code).to eql 200
     expect(@list_employee.message).to eql 'OK'
 end

Dado('que o usuario cadastre um novo funcionario') do                          
    @post_url = 'http://dummy.restapiexample.com/api/v1/create' 
  end                                                                            
                                                                                 
Quando('ele enviar as informaçoes do funcionario') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
        "id": 49,
        "employee_name": "Guto",
        "employee_salary": 420800,
        "employee_age": 33,
        "profile_image": ""
    }.to_json) 

    puts @create_employee 
  end   
                                                                
Então('esse funcionario sera cadastrado') do
    expect(@create_employee.code).to eql (200)
    expect(@create_employee.msg).to eql 'OK'
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee.parsed_response['data']["employee_name"]).to eql 'Guto'
    expect(@create_employee.parsed_response['data']["employee_salary"]).to eql (420800)
    expect(@create_employee.parsed_response['data']["employee_age"]).to eql (33)
 end          
 
Dado('que o usuario altere uma informação de fucncionario') do
  @get_employee = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
  puts @get_employee['data'][0]['id']
  @put_url = 'http://dummy.restapiexample.com/api/v1/update/' + @get_employee['data'][0]['id'].to_s 
end

Quando('ele enviar as novas informações') do
   @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
      "employee_name": "Edilma",
      "employee_salary": 1500,
      "employee_age": 58,
      "profile_image": ""
    }.to_json)

    puts(@update_employee)
end

Então('as informações serão alteradas') do
    expect(@update_employee.code).to eql (200)
    expect(@update_employee.msg).to eql 'OK'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee.parsed_response['data']["employee_name"]).to eql 'Edilma'
    expect(@update_employee.parsed_response['data']["employee_salary"]).to eql (1500)
    expect(@update_employee.parsed_response['data']["employee_age"]).to eql (58)
end
