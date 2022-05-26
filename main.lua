--Version 1.0
--variables
--Make sure to type "Yes" for the notifcations instead of done!
local list = {}
local scheduele = {}
local priorities = {}
local users = {"Jake"}
local passwords = {"PasswordTest"}
local user1list = {}
local user2list = {}
local time = 0
local timenum = #list
--wait function 
function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end
--this is the value that controls the position inputted chores and priorities have in the table
val = 1
--login system
io.write("Hello! Pleas input: 'Login' to start...")
ans = io.read()
	if ans == "Login" then
		io.write("What user would you like to login as?")
		ans1 = io.read()
	
		if ans1 == users[1] then
io.write("What is the password?")
	
if io.read() == passwords[1] then
io.write("Login success! Hello "..users[1]..". ")
else
os.exit()
end
end
		if ans1 == users[2] then
io.write("What is the password?")
	
if io.read() == passwords[2] then
io.write("Login success! Hello "..users[2]..". ")
else
os.exit()
end
end
else
os.exit()
end
--if statement to make sure that the person using the software is logged in with the correct username. This is a second check, just to make sure.
if ans1 == users[1] or ans1 == users[2] then
repeat
	io.write("Please input a chore: ")
		
table.insert(list, val, io.read())
		
print(val.." chore added. Press enter to continue or enter Done to be done.")
		
io.write("Please insert a priority for the chore: ")
table.insert(priorities,val,io.read())
		

		
print(val.." priority added. Press enter to continue or enter Done to be done.")
--increasing the val (or the position at which the chore is added to the table) so that the next chore that is added is added into the next available spot.
val = val + 1
--This until is here so that we can continously add chores until the user puts done. This allows for unlimited chores.
until io.read() == "Done" or io.read() == "done"

--resetting the val so that we can use it for the actual scheduele list.
val = 1

repeat
--What do each of these mean? "scheduele" represents the scheduele table we want to put everything into, val represents the position the value is inserted into the table, and the last string is what is actually inserted. The index or 'val' makes it so that the priority and chore that is put into the table is matched up with one another.
table.insert(scheduele,val,priorities[val].." "..list[val])
val = val + 1 
--this is another until statement. We are waiting unti the code runs through all of the "list" table, or until the amount of the values in scheduele is = the number list.
until #scheduele == #list

	--this is the sorting function, which sorts the table by the priority value we inserted earlier.
function alphanumsort(o)
	--this is the formatting function, which formats the # of the index, or the table, by d, or the priority.
  local function padnum(d) return ("%03d%s"):format(#d, d) end
	--this is the table sort function. o, or the table that we will put into the function later, is what this function is sorting. Function, is calling the function we stated above.	
  table.sort(o, function(a,b)
			--converting our sorts to strings so that the table can proccess them.
    return tostring(a):gsub("%d+",padnum) > tostring(b):gsub("%d+",padnum) end)
	--returnng o, or the table variable so we can access it later.
  return o
end
--we are calling the functionw now. By setting the o value to both scheduele in one function, and priorities in the other, we can get a sorted table of chores, and also, we can acess the sorted priorites, which will line up to the shceduele list we created. This means that we can use this priority value into things like time calculation.
alphanumsort(scheduele)

alphanumsort(priorities)

--this is the time denominator we will use to calculate the time for each chore. We have to put this into a variable because we can not concatenate a value with a string.
io.write("How much free time do you have in hours? ")
timedem = io.read()

--round function
	function round(num, numDecimalPlaces)
	--rounding to the tenth, hence, the tenth power.
  local mult = 10^(numDecimalPlaces or 0)
	--returning the value so we can use it.
  return math.floor(num * mult + 0.5) / mult
end
vallist = 0
repeat
	vallist = vallist + 1
print("Chore/time: "..string.sub(scheduele[vallist],3,50).."/"..round((priorities[vallist]/timedem)*30,2).." minutes ")

	until vallist == #scheduele

end

io.write("How much time between notifications (seconds) ")
local notiftime = io.read()
while true do
wait(notiftime)
if #scheduele > 0 then
print("System notification! Make sure to complete this chore: "..string.sub(scheduele[1],3,50))	
io.write("Are you done with this chore yet? ")
isDone = io.read()
if isDone == "yes" or isDone == "Yes" then
table.remove(scheduele,1)
	end
	

else
print("You are done with all of your chores! Nice job, sport!")
		os.exit()
end
end