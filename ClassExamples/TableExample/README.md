#  Readme
### Modifcications on the Table Example from class.

In class, we saw that the cells present a problem with the checkmark, this is because the recycling problem with TableViews
and how iOS mange that kind of .

For the class example, I found at stack overflow a solution for the state of the current cell.

Solution:

You make an array that store the status of the cell, since the checkmark don't give us a property to
store the status of it.

You can update the cellForRowAt Method and the DidSelectRowAt Method. 

### First Step

You make an array of booleans, for storing the status of the cells.

### Second Step

See more at "Mark: Recycling problem."
You make in the cellForRowAt method a validation with the array, and by checking the values of the array you add or not a checkmark in the cell. (With this lines of code we can fix the recycling problem.)

### Third Step
See more at "Mark: Handle the change of the checkmark and change of item on boolArray"
When selecting the cell you can change values on the boolean array and the checkmark.


### Notes:
Thanks to this delegate method, TableViews can work.  It's expected that in my noobiness of iOS development I'm still ammazed about the power of delegate methods. With them we can define a class and make it implement them in every model we define. 
