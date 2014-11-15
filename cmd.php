rails generate scaffold customer name:string email:string website:string contact:string website:string

rails generate scaffold task title:string due_on:date category:integer

rails generate scaffold lead first_name:string last_name:string email:string phone:string company:string interested:integer status:integer source:integer comment:text address:text 

rails generate scaffold contact name:string email:string website:string phone:string address:text 

rails generate scaffold interested title:string 
rails generate scaffold status title:string 
rails generate scaffold source title:string 
rails generate scaffold category title:string 

rails generate migration AddCommentColumnToLeads comment:text
rails generate migration AddCategoryColumnToTasks category:integer


rails generate scaffold level title:string permission:integer 
rails generate migration AddLevelColumnToUsers level:integer

rake db:migrate


rails r "print Rails.env"

//one time run query
@l = Level.new(:title => "Master Admin", :permission =>'1')
@l.save(validate: false)
@u = User.new(:email => 'admin', :password => 'admin', :level => '1')
@u.save
