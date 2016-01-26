#1.Local variable scope rules. Use method definition and blocks to demonstrate.
	#about variables
	#1.outer scope can be accessed to be inner scope or outer scope
	for example:

	a = 1

	loop do
	  puts a  #=> sherif
	  a = 2 + a #=> 3 
	  break
	end

  	puts a #=> 3
		
	# you can used variable name is (a) inner scope and outer scope but i change values of variable (a = 2 + a) and this is variable value is equal 3

	#2.inner scope can not be accessed to be outer scope
	for example:

	loop do
		name = "sherif"
		break
	end
	puts name  #=> Undefined local variable
	
	# this variable can't used outer loop. and when i need used outer scope i create variable before this loop.

	for example:
		name = nil
	loop do
		name = "sherif"
		break
	end
	puts name  #=> sherif


	3.nested blocks
	example:
	a = 1
	loop do    #=> first loop
		b = 2

		loop do	#=> second loop
			c = 3
			puts a #=> 1 
			puts b #=> 2
			puts c #=> 3
			break
		end

		puts a #=> 1
		puts b #=> 2
		puts c #=> undefined local variable
		break
	end
	puts a #=> 1
	puts b #=> undefined local variables
	puts c #=> undefined local variables

	you can't used varabile name is C in first loop and you can't used variable name is b outer first loop and you can used variable name is a inner local variables scope and outer scope.   

	4.peer scopes do not conflict

		3.times do
			a = 3
		end

		loop do
			puts a  #=> undefined local variable
			break
		end
	#i can't used a variable name is a in a second loop because this local variable when i need used this variable in a seconed loop i create variables before these loops.


	#for method

	#1.methods can't access variables in another scope

	a = 1

	def make_it
		puts a #=> undefined local variable 
	end

	make_it #=> undefined local variable

	#i can't used this variables in this method because i'm not create parameter for this method.

	#2. method can be access variables in another scope

	a = 1

	def make_it(s)
		puts s 
	end
 
	make_it(a) #=> 1

	#this is method  i create parameter and i insert a variable name is a inner call method.


	#Used blocks in method

	def used_block
		puts "Hello"
		yield  #=> I use this code (yield) to insert the block in this method.
	end
	used_block { puts "Hello World"} #this is block

	# when i run this code i show result 
	#=>Hello
	#=>Hello World 
# 2.Is Ruby pass by reference or pass by value? Use examples to demonstrate.
	# Ruby is pass by reference
		def make(a)
  			a[0] = 'f'
  			a
		end

		b = "hello" 
		puts make(b) , b
     in this example the passed argument value ‘hello’ has changed to (fello), and thus it proves that the argument is not passed by value otherwise the value of (s) would kept having the same value (hello).

# 3.Collection methods. Pick 3 of your favorite collection methods, and explain what each one does.
    # 1.include 
   		# example 
   		a = [1, 2, 3]
   		a.include?(3)  #=> true

   		# this is method is used to check if array include this value or not.

   	# 2.class

   	# example
   		"hello".class #=> string
   		# this is method is used to check type of value. and in this example i'm checked and the result is string.

   	#3.to_a

   	#example

   	(1..7).to_a #=> [1, 2, 3, 4, 5, 6, 7]

   	# in this example i used (to_a) to convert these values to array.

# 4.Explain what blocks are, and when you would want to write a method that can take a block.
	# the block is used to insert code inner method. and the do and end identify a block of code that will be executed for each item.and you can call a block using the yield keyword with a value.
	for example:

	def make_block
		puts "hello"
		yield
	end

	make_block { puts "hello world"}

	#if i run this code i show this result
	#=> hello
	#=> hello world

# 5.Explain the relationship between a class and an object.
	#A class defines the properties and behavior for the objects represented by the abstraction. Abstraction is a property of object oriented programming. It denotes the essential properties and behaviors of an object. It hides code and data. A class thus denotes a category of objects and act as a blueprint for creating such objects. An object exhibits the property and behaviors defined by its class. Generally, an object is an instance of a class.

# 6.Explain class inheritance, with code examples.
	#If we assume, for example, the names of people we have, and we want to add the job with the name.	
	#i'm use the class inheritance The aim is to add something new to the old the class, but i do not change the main class.
	# this is example :

	class Human 
	  def full_name(n)
	    puts "My name is #{n}."
	  end
	end
	human = Human.new
	human.full_name("Sherif Omar") #=> My name is Sherif Omar.

	class job < Human          # i'm enter the class (human)  on the class  (job).
	  def work(a)
	    puts " i'm working is #{a}"
	  end
	end

	person = job.new
	person.full_name("Sherif Omar") #=> My name is Sherif Omar.
	person.work("programmer") #=> My Age is 25 years old.

# 7. Explain what "self" means in the context of a class, and in the context of an instance method.
	#Self meaning to specify a certain scope for our program.
	example:
	class Hello
    	class << self
        	def say    
        	end
    	end
	end	
	#Every methods in block "class << sefl" is Class methods
	#That mean you just can access those methods in "class << self" by the class name